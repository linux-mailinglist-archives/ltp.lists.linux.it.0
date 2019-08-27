Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B39E910
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 15:20:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33A373C1C95
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 15:20:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DD1223C1C68
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 15:20:06 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 072D71401740
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 15:20:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C8D58AB25B;
 Tue, 27 Aug 2019 13:20:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ADDE194B9;
 Tue, 27 Aug 2019 13:20:04 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D3D624F30;
 Tue, 27 Aug 2019 13:20:04 +0000 (UTC)
Date: Tue, 27 Aug 2019 09:20:03 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>, 
 naresh kamboju <naresh.kamboju@linaro.org>
Message-ID: <241383129.8399897.1566912003912.JavaMail.zimbra@redhat.com>
In-Reply-To: <294428f05e4dba1a6b10b8744cfa5da0637f84a4.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
 <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
 <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
 <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
 <566e862d9bfaf88cdde6d66f0f59033fe6225a22.camel@hammerspace.com>
 <866876796.8349197.1566901536625.JavaMail.zimbra@redhat.com>
 <294428f05e4dba1a6b10b8744cfa5da0637f84a4.camel@hammerspace.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.166, 10.4.195.29]
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UAj4lK/k3wd0xbAPZWZFoxiapkYwBjzrsPWQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Tue, 27 Aug 2019 13:20:04 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325:
 Failed to run cmd: useradd hsym
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, the hoang0709 <the_hoang0709@yahoo.com>,
 linux-next@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> On Tue, 2019-08-27 at 06:25 -0400, Jan Stancek wrote:
> > That theory is probably not correct for this case, since EIO I see
> > appears
> > to originate from write and nfs_writeback_result(). This function
> > also
> > produces message we saw in logs from Naresh.
> > 
> > I can't find where/how is resp->count updated on WRITE reply in
> > NFSv2.
> > Issue also goes away with patch below, though I can't speak about its
> > correctness:
> > 
> > NFS version     Type    Test    Return code
> > nfsvers=2       tcp     -b:base         0
> > nfsvers=2       tcp     -g:general      0
> > nfsvers=2       tcp     -s:special      0
> > nfsvers=2       tcp     -l:lock         0
> > Total time: 141
> > 
> > diff --git a/fs/nfs/nfs2xdr.c b/fs/nfs/nfs2xdr.c
> > index cbc17a203248..4913c6da270b 100644
> > --- a/fs/nfs/nfs2xdr.c
> > +++ b/fs/nfs/nfs2xdr.c
> > @@ -897,6 +897,16 @@ static int nfs2_xdr_dec_writeres(struct rpc_rqst
> > *req, struct xdr_stream *xdr,
> >                                  void *data)
> >  {
> >         struct nfs_pgio_res *result = data;
> > +       struct rpc_task *rq_task  = req->rq_task;
> > +
> > +       if (rq_task) {
> > +               struct nfs_pgio_args *args = rq_task-
> > >tk_msg.rpc_argp;
> > +
> > +               if (args) {
> > +                       result->count = args->count;
> > +               }
> > +       }
> >  
> >         /* All NFSv2 writes are "file sync" writes */
> >         result->verf->committed = NFS_FILE_SYNC;
> 
> Thanks! I've moved the above to nfs_write_done() so that we do it only
> on success (see
> http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=3ba5688da709dd0f7d917029c206bc1848a6ae74
> )

Thanks, retested with 3ba5688da, all PASS:

NFS version     Type    Test    Return code
nfsvers=2       tcp     -b:base         0
nfsvers=2       tcp     -g:general      0
nfsvers=2       tcp     -s:special      0
nfsvers=2       tcp     -l:lock         0

NFS version     Type    Test    Return code
nfsvers=3       tcp     -b:base         0
nfsvers=3       tcp     -g:general      0
nfsvers=3       tcp     -s:special      0
nfsvers=3       tcp     -l:lock         0
nfsvers=3       tcp6    -b:base         0
nfsvers=3       tcp6    -g:general      0
nfsvers=3       tcp6    -s:special      0
nfsvers=3       tcp6    -l:lock         0

NFS version     Type    Test    Return code
nfsvers=4       tcp     -b:base         0
nfsvers=4       tcp     -g:general      0
nfsvers=4       tcp     -s:special      0
nfsvers=4       tcp     -l:lock         0
nfsvers=4       tcp6    -b:base         0
nfsvers=4       tcp6    -g:general      0
nfsvers=4       tcp6    -s:special      0
nfsvers=4       tcp6    -l:lock         0

Feel free to add also:

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Jan Stancek <jstancek@redhat.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
