using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using jhl.web.Models;
using jhl.web.Models.ViewModel;
using System.Web;
using Newtonsoft.Json;
using System.Data.Entity.Validation;

namespace jhl.web.api
{
    public class UsersController : ApiController
    {
        private jhl_dbEntities db = new jhl_dbEntities();

        // GET: api/Users
        public IEnumerable<ListUserViewModel> GetUsers([FromUri]PagingViewModel pagingparametermodel, [FromUri] string keyWord = "")
        {
            var result = new List<User>();
            var users = db.Users.Where(m => m.Deleted != true);
            if (keyWord != null && keyWord.Length > 0)
            {
                result = users.Where(m => m.Username.Contains(keyWord) || m.FirstName.Contains(keyWord) || m.LastName.Contains(keyWord) || m.Email.Contains(keyWord) || m.Phone.Contains(keyWord)).ToList();
            }
            else
            {
                result = users.ToList();
            }
            var source = result.OrderByDescending(m => m.ID).Select(user => new ListUserViewModel
            {
                ID = user.ID,
                Username = user.Username,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Phone = user.Phone,
                Email = user.Email,
                PhotoImage = user.Image.Path,
                Active = user.Active == true ? "Đang hoạt động" : "Ngừng hoạt động",
                Created = user.Created
            }).AsQueryable();
            int count = source.Count();
            int CurrentPage = pagingparametermodel.pageNumber;
            int PageSize = pagingparametermodel.pageSize;
            int TotalCount = count;
            int TotalPages = (int)Math.Ceiling(count / (double)PageSize);
            var items = source.Skip((CurrentPage - 1) * PageSize).Take(PageSize).ToList();
            var previousPage = CurrentPage > 1 ? "Yes" : "No";
            var nextPage = CurrentPage < TotalPages ? "Yes" : "No";

            // Object which we are going to send in header   
            var paginationMetadata = new
            {
                totalCount = TotalCount,
                pageSize = PageSize,
                currentPage = CurrentPage,
                totalPages = TotalPages,
                previousPage,
                nextPage
            };

            // Setting Header  
            HttpContext.Current.Response.Headers.Add("Paging-Headers", JsonConvert.SerializeObject(paginationMetadata));
            // Returing List of Customers Collections  
            return items;

        }

        // GET: api/Users/5
        [ResponseType(typeof(User))]
        public async Task<IHttpActionResult> GetUser(int id)
        {
            User user = await db.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            return Ok(user);
        }

        // PUT: api/Users/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutUser(int id, User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user.ID)
            {
                return BadRequest();
            }
            user.Modified = DateTime.Now;
            db.Entry(user).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Users
        [ResponseType(typeof(User))]
        public async Task<IHttpActionResult> PostUser(User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            user.Attempt = 3;
            user.Active = true;
            user.Deleted = false;
            user.Created = DateTime.Now;
            user.CreatedBy = null;
            user.Modified = DateTime.Now;
            user.ModifiedBy = null;
            db.Users.Add(user);
            try
            {
                await db.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                var zzz = ex;
                throw;
            }

            return CreatedAtRoute("DefaultApi", new { id = user.ID }, user);
        }

        // DELETE: api/Users/5
        [ResponseType(typeof(User))]
        public async Task<IHttpActionResult> DeleteUser(int id)
        {
            User user = await db.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            user.Active = false;
            user.Deleted = true;
            db.Entry(user).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok(user);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserExists(int id)
        {
            return db.Users.Count(e => e.ID == id) > 0;
        }
    }
}