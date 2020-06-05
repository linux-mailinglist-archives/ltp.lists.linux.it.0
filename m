Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E41EF51F
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 12:14:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4073A3C2F64
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 12:14:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4C75D3C223E
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 12:14:55 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4F1071401621
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 12:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591352092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nb9g3nvvKfET99JdThBeds6zSYdvG4IOgrn4BKRvwgM=;
 b=c0P5mQL3FqPROjiJuQ17ALiXtAG1heSNshPPnz3lbgiwudzkrx+MZeZ47Z31+4bID+yay9
 JnY7k/37t2HAIKL4nL+SXpc1jq5DbaW5lzn0HOQOd+4M6/CtJIufagvx3tAQRDeLuo5VUG
 BXd0qLqu54eMi9w17xOGfIiPrbmTqfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-Kq9i-wTnPFWwdO7gOe6vXQ-1; Fri, 05 Jun 2020 06:14:50 -0400
X-MC-Unique: Kq9i-wTnPFWwdO7gOe6vXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B599E80B72F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 10:14:49 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15B4C9CA0;
 Fri,  5 Jun 2020 10:14:46 +0000 (UTC)
Date: Fri, 5 Jun 2020 12:14:43 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200605101443.GA6826@janakin.usersys.redhat.com>
References: <20200601100459.32511-1-liwang@redhat.com>
 <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
 <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
 <20200602121232.GA22599@janakin.usersys.redhat.com>
 <CAEemH2d7OzG6jBZ15bYGRHm7ry-gVjzuwJYhbHp3yitB3_928w@mail.gmail.com>
 <20200603104314.GA12583@janakin.usersys.redhat.com>
 <CAEemH2ey08M+-ddqh1DNWSOWSi7RNYz8ho=MSPQryYHSqamffg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEemH2ey08M+-ddqh1DNWSOWSi7RNYz8ho=MSPQryYHSqamffg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jun 03, 2020 at 08:51:37PM +0800, Li Wang wrote:
>> I don't get why global variables are necessary.
>>
>
>The only reason to export them as global variables is to make the legacy
>read/write_cpuse_files() happy. So that I said it is a compromise.
>
>$ git grep tst_cgroup_new_path
>cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "cpus",
>buf);
>cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
>mems);
>cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
>buf);
>cpuset/cpuset01.c:      write_cpuset_files(tst_cgroup_new_path, "mems",
>buf);
>lib/mem.c:      write_cpuset_files(tst_cgroup_new_path, "mems", buf);
>lib/mem.c:              write_cpuset_files(tst_cgroup_new_path, "cpus",
>cpus);
>lib/mem.c:              write_cpuset_files(tst_cgroup_new_path, "cpus",
>"0");
>oom/oom04.c:            write_cpuset_files(tst_cgroup_new_path,
>"memory_migrate", "1");
>oom/oom05.c:            write_cpuset_files(tst_cgroup_new_path,
>"memory_migrate", "1");

What if we provided access to it via API? Would we still need these
global variables?

  char *tst_cgroup_get_path(const char *cgroup_mnt)
      // return ptr to tst_cgroup_paths->new_path

mount path is always known to test, because it passes it to tst_cgroup_mount(),
so it just needs to find out "new path".

Would that satisfy the need of this legacy test?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
