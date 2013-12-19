$ ->
  globals = window.Dmtc.Globals
  code = _.extend(globals.code, { liked: globals.liked })
  window.codeModel = new Dmtc.Models.Code(code)
  new Dmtc.Views.ShowCode({ model: codeModel })

  comments = new Dmtc.Collections.Comments(globals.comments)
  new Dmtc.Views.NewComment({ codeId: code.id, comments: comments })
  new Dmtc.Views.CommentsIndex({ collection: comments })

  codeVote = _.extend(code, { voted: globals.voted })
  window.codeVoteModel = new Dmtc.Models.CodeVote(codeVote)
  new Dmtc.Views.CodeVote({ model: codeVoteModel })
