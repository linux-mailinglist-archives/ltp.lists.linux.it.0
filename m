Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4B1E1D48
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:27:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54E663C32BB
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:27:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3E6713C325D
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:27:36 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E94EC100126C
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:27:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590481654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scsrJxakJQ3aJJ0UkmrlMonIRSM5JJfOGOTAJhldswY=;
 b=O+8CLJSytAjqS+BnuEa+fMCDn65UnryHf08c9m59XnWwWhuQhpXBzv8FZ6FkjEzKLo0jRQ
 NajPYvGn0arc2ddksImwcgzzUMJ9grBWWhtlen8eRPiNgtUMk1jUKwFI1JLUqZrKbYKz+g
 6tQqFX3EMJthCbNQQbKkH//PvCtlz6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-t8EunzcROS6RZp9sq_Hu7w-1; Tue, 26 May 2020 04:27:32 -0400
X-MC-Unique: t8EunzcROS6RZp9sq_Hu7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73216EC1AC
 for <ltp@lists.linux.it>; Tue, 26 May 2020 08:27:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D69E6EDAA
 for <ltp@lists.linux.it>; Tue, 26 May 2020 08:27:31 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6693B1809541;
 Tue, 26 May 2020 08:27:31 +0000 (UTC)
Date: Tue, 26 May 2020 04:27:31 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1156025603.13595880.1590481651127.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200522012327.18991-1-liwang@redhat.com>
References: <20200522012327.18991-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.29]
Thread-Topic: add new cgroup test API
Thread-Index: rCIbDQyYUHX9t0cBLLT9aQoaVFJhUA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC 1/4] lib: add new cgroup test API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----

> +
> +/* cgroup v1 */
> +#define PATH_TMP_CG1_MEM	"/tmp/cgroup1_mem"
> +#define PATH_TMP_CG1_CST	"/tmp/cgroup1_cpuset"

It's only used for mount, so not sure if making it relative to TMPDIR
buys us anything.

> +
> +/* cgroup v1 */
> +void tst_mount_cgroup1(const char *name, const char *option,
> +			const char *mnt_path, const char *new_path)

I'd make all cgroup API start with tst_cgroup*.

Is the intent to provide API for both v1 and v2, or just higher level API
that hides the details?

> +{
> +	if (tst_is_mounted(mnt_path))
> +		goto out;
> +
> +	SAFE_MKDIR(mnt_path, 0777);
> +	if (mount(name, mnt_path, "cgroup", 0, option) == -1) {
> +		if (errno == ENODEV) {
> +			if (rmdir(mnt_path) == -1)
> +				tst_res(TWARN | TERRNO, "rmdir %s failed", mnt_path);
> +			tst_brk(TCONF,
> +				 "Cgroup v1 is not configured in kernel");
> +		}

We should probably handle also EBUSY, for cases when controller is already part
of existing hierarchy. E.g. cpu,cpuacct is mounted together, and someone
tries to mount just cpu:
  mount("none", "/mnt/cgroup", "cgroup", MS_MGC_VAL, "cpu") = -1 EBUSY (Device or resource busy)

> +
> +void tst_write_memcg1(long memsz)

This should at least say memmax or something similar, if we add
functions for more knobs later.

I'm thinking if it would be worth having API more parametrized,
something like:

enum tst_cgroup_ctrl {
        TST_CGROUP_MEMCG = 1,
        TST_CGROUP_CPUSET = 2,
};

tst_cgroup_mount(enum tst_cgroup_ctrl)
tst_cgroup_umount(enum tst_cgroup_ctrl)
  // tests wouldn't need to use these ones directly
  // would be probably internal functions

tst_cgroup_version()
  // to get/check cgroup support in setup()

tst_cgroup_create(enum tst_cgroup_ctrl, const char *dir)
  // mounts cgroup if not already mounted
  // creates "dir", sets up subtree_control, etc.

tst_cgroup_cleanup()
  // cleans up everything, removes dirs, umounts what was mounted

tst_cgroup_move_current(enum tst_cgroup_ctrl, const char *dir)
  // writes getpid() to dir/"tasks"

tst_cgroup_mem_set_maxbytes(const char *dir, long memsz)
  // memcg specific function


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
