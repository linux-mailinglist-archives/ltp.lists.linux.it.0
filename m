Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C139E59F
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:25:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBDC73C1C9A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:25:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9FA933C1850
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:25:41 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 900341401B52
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:25:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3EB987638;
 Tue, 27 Aug 2019 10:25:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E86E35C1B2;
 Tue, 27 Aug 2019 10:25:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D53A52551B;
 Tue, 27 Aug 2019 10:25:36 +0000 (UTC)
Date: Tue, 27 Aug 2019 06:25:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <866876796.8349197.1566901536625.JavaMail.zimbra@redhat.com>
In-Reply-To: <566e862d9bfaf88cdde6d66f0f59033fe6225a22.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <20190826104127.GA14729@haruka>
 <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
 <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
 <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
 <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
 <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
 <566e862d9bfaf88cdde6d66f0f59033fe6225a22.camel@hammerspace.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.166, 10.4.195.26]
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UAj4lK/k3wd0xbAPZWZFox
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 27 Aug 2019 10:25:37 +0000 (UTC)
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
> On Mon, 2019-08-26 at 19:12 -0400, Jan Stancek wrote:
> > ----- Original Message -----
> > > On Mon, 2019-08-26 at 10:38 -0400, Jan Stancek wrote:
> > > > ----- Original Message -----
> > > > > Hi Jan and Cyril,
> > > > > 
> > > > > On Mon, 26 Aug 2019 at 16:35, Jan Stancek <jstancek@redhat.com>
> > > > > wrote:
> > > > > > 
> > > > > > ----- Original Message -----
> > > > > > > Hi!
> > > > > > > > Do you see this LTP prot_hsymlinks failure on linux next
> > > > > > > > 20190823 on
> > > > > > > > x86_64 and i386 devices?
> > > > > > > > 
> > > > > > > > test output log,
> > > > > > > > useradd: failure while writing changes to /etc/passwd
> > > > > > > > useradd: /home/hsym was created, but could not be removed
> > > > > > > 
> > > > > > > This looks like an unrelated problem, failure to write to
> > > > > > > /etc/passwd
> > > > > > > probably means that filesystem is full or some problem
> > > > > > > happend
> > > > > > > and how
> > > > > > > is remounted RO.
> > > > > > 
> > > > > > In Naresh' example, root is on NFS:
> > > > > >   root=/dev/nfs rw
> > > > > >  
> > > > > > nfsroot=10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extr
> > > > > > act-
> > > > > > nfsrootfs-tyuevoxm,tcp,hard,intr
> > > > > 
> > > > > Right !
> > > > > root is mounted on NFS.
> > > > > 
> > > > > > 10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-
> > > > > > nfsrootfs-tyuevoxm
> > > > > > on / type nfs
> > > > > > (rw,relatime,vers=2,rsize=4096,wsize=4096,namlen=255,hard,nol
> > > > > > ock,
> > > > > > proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=10.66.16.123,
> > > > > > moun
> > > > > > tvers=1,mountproto=tcp,local_lock=all,addr=10.66.16.123)
> > > > > > devtmpfs on /dev type devtmpfs
> > > > > > (rw,relatime,size=3977640k,nr_inodes=994410,mode=755)
> > > > > > 
> > > 
> > > The only thing I can think of that might cause an EIO on NFSv2
> > > would be
> > > this patch
> > > http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=627d48e597ec5993c4abb3b81dc75e554a07c7c0
> > > assuming that a bind-related error is leaking through.
> > > 
> > > I'd suggest something like the following to fix it up:
> > 
> > No change with that patch,
> > but following one fixes it for me:
> > 
> > diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
> > index 20b3717cd7ca..56cefa0ab804 100644
> > --- a/fs/nfs/pagelist.c
> > +++ b/fs/nfs/pagelist.c
> > @@ -590,7 +590,7 @@ static void nfs_pgio_rpcsetup(struct
> > nfs_pgio_header *hdr,
> >         }
> >  
> >         hdr->res.fattr   = &hdr->fattr;
> > -       hdr->res.count   = 0;
> > +       hdr->res.count   = count;
> >         hdr->res.eof     = 0;
> >         hdr->res.verf    = &hdr->verf;
> >         nfs_fattr_init(&hdr->fattr);
> > 
> > which is functionally revert of "NFS: Fix initialisation of I/O
> > result struct in nfs_pgio_rpcsetup".
> > 
> > This hunk caught my eye, could res.eof == 0 explain those I/O errors?
> 
> Interesting hypothesis. It could if res.count ends up being 0. So does
> the following also fix the problem?

It didn't fix it.

That theory is probably not correct for this case, since EIO I see appears
to originate from write and nfs_writeback_result(). This function also
produces message we saw in logs from Naresh.

I can't find where/how is resp->count updated on WRITE reply in NFSv2.
Issue also goes away with patch below, though I can't speak about its correctness:

NFS version     Type    Test    Return code
nfsvers=2       tcp     -b:base         0
nfsvers=2       tcp     -g:general      0
nfsvers=2       tcp     -s:special      0
nfsvers=2       tcp     -l:lock         0
Total time: 141

diff --git a/fs/nfs/nfs2xdr.c b/fs/nfs/nfs2xdr.c
index cbc17a203248..4913c6da270b 100644
--- a/fs/nfs/nfs2xdr.c
+++ b/fs/nfs/nfs2xdr.c
@@ -897,6 +897,16 @@ static int nfs2_xdr_dec_writeres(struct rpc_rqst *req, struct xdr_stream *xdr,
                                 void *data)
 {
        struct nfs_pgio_res *result = data;
+       struct rpc_task *rq_task  = req->rq_task;
+
+       if (rq_task) {
+               struct nfs_pgio_args *args = rq_task->tk_msg.rpc_argp;
+
+               if (args) {
+                       result->count = args->count;
+               }
+       }
 
        /* All NFSv2 writes are "file sync" writes */
        result->verf->committed = NFS_FILE_SYNC;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
