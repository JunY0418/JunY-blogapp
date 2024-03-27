import $ from 'jquery'
import axios from 'modules/axios'
import {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
} from 'modules/handle_heart'
// turbolinks.js
// import Turbolinks from 'turbolinks';

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}
const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}
const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="article_comment"><p>${comment.content}</p></div>`
  )
}

// document.addEventListener('turbolinks:load', function() {
//   const dataset = $('#article-show').data();
//   const articleId = dataset.articleId;

//   // Flag to track whether comments are already loaded
//   let commentsLoaded = false;

//   // Function to load comments
//   const loadComments = () => {
//     axios.get(`/articles/${articleId}/comments`)
//       .then((response) => {
//         const comments = response.data;
//         const commentsContainer = $('.comments-container');

//         // Clear existing comments
//         commentsContainer.empty();

//         // Append new comments
//         comments.forEach((comment) => {
//           appendNewComment(comment);
//         });
//       })
//       .catch(() => {
//         window.alert('Failed to load comments!');
//       });

//     // Set the flag to true after comments are loaded
//     commentsLoaded = true;
//   };

//   // Load comments only if they haven't been loaded before
//   if (!commentsLoaded) {
//     loadComments();
//   }

//   handleCommentForm();

//   // Click event for adding a comment
//   $('.add-comment-button').off('click').on('click', () => {
//     const content = $('#comment_content').val();
//     if (!content) {
//       window.alert('Please enter a comment');
//     } else {
//       axios.post(`/articles/${articleId}/comments`, {
//         comment: { content: content }
//       })
//       .then((res) => {
//         const comment = res.data;
//         appendNewComment(comment);
//         $('#comment_content').val('');
//       });
//     }
//   });

//   axios.get(`/articles/${articleId}/like`)
//     .then((response) => {
//       const hasLiked = response.data.hasLiked;
//       handleHeartDisplay(hasLiked);
//     });

//   listenInactiveHeartEvent(articleId);
//   listenActiveHeartEvent(articleId);
// });

// // Initialize Turbolinks
// Turbolinks.start();

// document.addEventListener('turbolinks:load', function() {

//   // 以前のイベントハンドラを削除
//   $('.add-comment-button').off('click')

//   const dataset = $('#article-show').data()
//   const articleId = dataset.articleId

//   // 一度だけ実行するためのフラグ
//   let commentsLoaded = false

//   const loadComments = () => {
//     axios.get(`/articles/${articleId}/comments`)
//       .then((response) => {
//         const comments = response.data
//         const commentsContainer = $('.comments-container')

//         // 既存のコメントを一度だけ削除
//         commentsContainer.empty()

//         // 新しいコメントを追加
//         comments.forEach((comment) => {
//           appendNewComment(comment)
//         })
//       })
//       .catch(() => {
//         window.alert('失敗！')
//       })

//     commentsLoaded = true
//   }

//   // ページが読み込まれたらコメントを取得して表示
//   if (!commentsLoaded) {
//     loadComments()
//   }

//   handleCommentForm()

//   $('.add-comment-button').on('click', () => {
//     const content = $('#comment_content').val()
//     if (!content) {
//       window.alert('コメントを入力してください')
//     } else {
//       axios.post(`/articles/${articleId}/comments`, {
//         comment: {content: content}
//       })
//         .then((res) => {
//           const comment = res.data
//           appendNewComment(comment)
//           $('#comment_content').val('')
//         })
//     }
//   })

//   axios.get(`/articles/${articleId}/like`)
//     .then((response) => {
//       const hasLiked = response.data.hasLiked
//       handleHeartDisplay(hasLiked)
//     })

//   listenInactiveHeartEvent(articleId)
//   listenActiveHeartEvent(articleId)
// })

// Turbolinks.start();
document.addEventListener('turbolinks:load', function() {
  const dataset = $('#article-show').data()
  const articleId = dataset.articleId

  axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
      })
    })
    .catch(() => {
      window.alert('失敗！')
    })

  handleCommentForm()

  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/articles/${articleId}/comments`, {
        comment: {content: content}
      })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment)
          $('#comment_content').val('')
        })
    }
  })

  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })

  listenInactiveHeartEvent(articleId)
  listenActiveHeartEvent(articleId)
})