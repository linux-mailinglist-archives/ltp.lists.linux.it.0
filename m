Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B061620AB
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:09:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFE723C25A0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:09:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 31B063C2360
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:09:09 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 79D2A60086B
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582006142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auQw+t5JWfv9TKJ45xvh99PR8Mdvv+eSXCzEivDrwZE=;
 b=DCWEZ5ePF+Iez5WG//cwkdMcUfi+KSkpfCCAPfAqe1vhXKwAc6oPRf5hlGgVpKWlEufSfJ
 uHfadx4+2H83khUQb2xQgAiBFUlPFdUS4E9qH1rxvgIPwkPpXOAN9Eshxs9IEdFYzV1Bcj
 cLQuhHQ4uwV+zFcKYrQtWOxoyTqnWuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-SCL5QvfoPPyN_rI5691K_A-1; Tue, 18 Feb 2020 01:08:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC70107ACC4;
 Tue, 18 Feb 2020 06:08:48 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8744D60BE1;
 Tue, 18 Feb 2020 06:08:47 +0000 (UTC)
Date: Tue, 18 Feb 2020 14:19:06 +0800
From: Zorro Lang <zlang@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200218061906.GB14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Viresh Kumar <viresh.kumar@linaro.org>,
	ltp@lists.linux.it
References: <cover.1581680021.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cover.1581680021.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: SCL5QvfoPPyN_rI5691K_A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/7] Add new LTP tests related to fsmount family
 of syscalls
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

On Fri, Feb 14, 2020 at 05:05:49PM +0530, Viresh Kumar wrote:
> Hello,
> 
> This series adds a bunch of LTP tests related to fsmount family of
> syscalls.

Hi Viresh,

Thanks for all these cases, that's really helpful.

Although you write cases for each new mount API, each xxxxx01.c case looks
nearly do same things.

That's why I only wrote one case for new-mount currently, due to basic mount
test already can through most of new APIs(except open_tree and fspick). I don't
know if we should write nearly same things in different directories.
Actually I prepared open_tree and fspick test cases(planned to name as newmount02
and newmount03. but the newmount01 has been changed to fsmount01 :), but didn't
sent out, due to I hope to the first case(which does basic changes) can be merged
at first.

All of your xxxxx02.c cases are great! I planned to test more different
parameters of fsconfig() later too. Your invalid parameters test are nice.
As you've sent these cases, I think these should be reviewed at first, avoid
we do same things:) I'll try to help to review V2 patchset too, if I can:-P

Thanks,
Zorro

> 
> Thanks
> 
> --
> viresh
> 
> Viresh Kumar (7):
>   lapi/fsmount: Add definitions for fsmount related syscalls
>   syscalls/fsopen: New tests
>   syscalls/fsconfig: New tests
>   syscalls/fsmount: New tests
>   syscalls/move_mount: New tests
>   syscalls/fspick: New tests
>   syscalls/open_tree: New tests
> 
>  configure.ac                                  |   6 +
>  include/lapi/fsmount.h                        | 134 ++++++++++++++++++
>  runtest/syscalls                              |  18 +++
>  testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
>  testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
>  .../kernel/syscalls/fsconfig/fsconfig01.c     |  77 ++++++++++
>  .../kernel/syscalls/fsconfig/fsconfig02.c     |  97 +++++++++++++
>  testcases/kernel/syscalls/fsmount/.gitignore  |   2 +
>  testcases/kernel/syscalls/fsmount/Makefile    |   6 +
>  testcases/kernel/syscalls/fsmount/fsmount01.c |  71 ++++++++++
>  testcases/kernel/syscalls/fsmount/fsmount02.c |  83 +++++++++++
>  testcases/kernel/syscalls/fsopen/.gitignore   |   2 +
>  testcases/kernel/syscalls/fsopen/Makefile     |   6 +
>  testcases/kernel/syscalls/fsopen/fsopen01.c   |  71 ++++++++++
>  testcases/kernel/syscalls/fsopen/fsopen02.c   |  56 ++++++++
>  testcases/kernel/syscalls/fspick/.gitignore   |   2 +
>  testcases/kernel/syscalls/fspick/Makefile     |   6 +
>  testcases/kernel/syscalls/fspick/fspick01.c   | 104 ++++++++++++++
>  testcases/kernel/syscalls/fspick/fspick02.c   | 110 ++++++++++++++
>  .../kernel/syscalls/move_mount/.gitignore     |   2 +
>  testcases/kernel/syscalls/move_mount/Makefile |   6 +
>  .../kernel/syscalls/move_mount/move_mount01.c |  82 +++++++++++
>  .../kernel/syscalls/move_mount/move_mount02.c | 102 +++++++++++++
>  .../kernel/syscalls/open_tree/.gitignore      |   2 +
>  testcases/kernel/syscalls/open_tree/Makefile  |   6 +
>  .../kernel/syscalls/open_tree/open_tree01.c   | 115 +++++++++++++++
>  .../kernel/syscalls/open_tree/open_tree02.c   | 110 ++++++++++++++
>  27 files changed, 1284 insertions(+)
>  create mode 100644 include/lapi/fsmount.h
>  create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile
>  create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c
>  create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c
>  create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fsmount/Makefile
>  create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c
>  create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c
>  create mode 100644 testcases/kernel/syscalls/fsopen/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fsopen/Makefile
>  create mode 100644 testcases/kernel/syscalls/fsopen/fsopen01.c
>  create mode 100644 testcases/kernel/syscalls/fsopen/fsopen02.c
>  create mode 100644 testcases/kernel/syscalls/fspick/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fspick/Makefile
>  create mode 100644 testcases/kernel/syscalls/fspick/fspick01.c
>  create mode 100644 testcases/kernel/syscalls/fspick/fspick02.c
>  create mode 100644 testcases/kernel/syscalls/move_mount/.gitignore
>  create mode 100644 testcases/kernel/syscalls/move_mount/Makefile
>  create mode 100644 testcases/kernel/syscalls/move_mount/move_mount01.c
>  create mode 100644 testcases/kernel/syscalls/move_mount/move_mount02.c
>  create mode 100644 testcases/kernel/syscalls/open_tree/.gitignore
>  create mode 100644 testcases/kernel/syscalls/open_tree/Makefile
>  create mode 100644 testcases/kernel/syscalls/open_tree/open_tree01.c
>  create mode 100644 testcases/kernel/syscalls/open_tree/open_tree02.c
> 
> -- 
> 2.21.0.rc0.269.g1a574e7a288b
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
