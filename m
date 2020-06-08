Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 930541F15DB
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 11:48:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44B8A3C2EB6
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 11:48:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DF5313C2068
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 11:48:48 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id BA618140124C
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 11:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRnztmZlHcNnCg/nMyyyplv47MMGqK23AyxN/jmC7V0=;
 b=Q4/Hv89490oQBAj0yu756jmvm1Z/g6OJqQiw57kaSvT67/hQK7gsJ+mTkbQkGoOeaGzrMf
 dqPag/fqHS4fNX0Uy5UXQhQPD0Lg4oWForAy4MGJzEhpWTIQLQH07YkBV9/eBSjhMDtZYP
 8IB5TmAEqCAOqC6MrmaKWe9GQsoyA9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-Oo8qTcptOKe1DePKdtcfvw-1; Mon, 08 Jun 2020 05:48:44 -0400
X-MC-Unique: Oo8qTcptOKe1DePKdtcfvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 683E81902EA1
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 09:48:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 623D1891F7
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 09:48:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09C2418095FF;
 Mon,  8 Jun 2020 09:48:43 +0000 (UTC)
Date: Mon, 8 Jun 2020 05:48:42 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <595558785.15122565.1591609722778.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cCLY1htBYPm9tuefyzdg6EqmFRrcMin76kf_LcMA2f3A@mail.gmail.com>
References: <20200601100459.32511-1-liwang@redhat.com>
 <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
 <20200602121232.GA22599@janakin.usersys.redhat.com>
 <CAEemH2d7OzG6jBZ15bYGRHm7ry-gVjzuwJYhbHp3yitB3_928w@mail.gmail.com>
 <20200603104314.GA12583@janakin.usersys.redhat.com>
 <CAEemH2ey08M+-ddqh1DNWSOWSi7RNYz8ho=MSPQryYHSqamffg@mail.gmail.com>
 <20200605101443.GA6826@janakin.usersys.redhat.com>
 <CAEemH2cCLY1htBYPm9tuefyzdg6EqmFRrcMin76kf_LcMA2f3A@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.7]
Thread-Topic: add new cgroup test API
Thread-Index: 52DOHGdrtPVoo53Axu27MAPTleGalA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib: add new cgroup test API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> On Fri, Jun 5, 2020 at 6:14 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> > On Wed, Jun 03, 2020 at 08:51:37PM +0800, Li Wang wrote:
> > >> I don't get why global variables are necessary.
> > >>
> > >
> > >The only reason to export them as global variables is to make the legacy
> > >read/write_cpuse_files() happy. So that I said it is a compromise.
> > >
> > >$ git grep tst_cgroup_new_path
> > >cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "cpus",
> > >buf);
> > >cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
> > >mems);
> > >cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
> > >buf);
> > >cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
> > >buf);
> > >lib/mem.c:      write_cpuset_files(tst_cgroup_new_path, "mems", buf);
> > >lib/mem.c:              write_cpuset_files(tst_cgroup_new_path, "cpus",
> > >cpus);
> > >lib/mem.c:              write_cpuset_files(tst_cgroup_new_path, "cpus",
> > >"0");
> > >oom/oom04.c:            write_cpuset_files(tst_cgroup_new_path,
> > >"memory_migrate", "1");
> > >oom/oom05.c:            write_cpuset_files(tst_cgroup_new_path,
> > >"memory_migrate", "1");
> >
> > What if we provided access to it via API? Would we still need these
> > global variables?
> >
> >   char *tst_cgroup_get_path(const char *cgroup_mnt)
> >       // return ptr to tst_cgroup_paths->new_path
> >
> 
> The series of list operating function are hiding in the library. My thought
> is
> to make the list transparent to users.
> 
> In your method, we have to export the tst_cgroup_get_path() as an external
> function, it stills needs an extra local pointer in testcase to store the
> got new_path,
> it doesn't seem tidier too.

But there would be clear connection between function and variable.
  new_path = tst_cgroup_get_path(cgroup_dir);
vs.
  tst_cgroup_get_path(cgroup_dir);
  // fyi, tst_cgroup_new_path is updated as side-effect of call above
  // What other calls do update tst_cgroup_new_path? Have a look at implementation.

> 
> 
> > mount path is always known to test, because it passes it to
> > tst_cgroup_mount(),
> > so it just needs to find out "new path".
> >
> > Would that satisfy the need of this legacy test?
> 
> 
> How about moving the cpuset legacy code to the library as part of APIs?
> That'd
> help to capsulate all the operation of cgroup control in lib, and people
> just need
> to invoke the related function as what he/she wants.
> 
> +void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char
> *filename, char *buf);
> +void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char
> *filename, const char *buf);
> 
> Then 'tst_cgroup_new_path' searching work will all located internally. And
> 'tst_cgroup_ctl_knob' can
> be local variable too.
> 
> Any other comments? (attach the v3.1)

That makes it somewhat better, since it's only concern of library code now.
But since there are no tests using "tst_cgroup_new_path", does it still
need to be global variable?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
