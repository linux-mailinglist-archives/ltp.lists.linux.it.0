Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B2DC64B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 15:39:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 789A33C23C1
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 15:39:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 982FC3C23AD
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:39:44 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 979C7200C81
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:39:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF0862DD98;
 Fri, 18 Oct 2019 13:39:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5CFF5C1B5;
 Fri, 18 Oct 2019 13:39:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDD2F1808878;
 Fri, 18 Oct 2019 13:39:41 +0000 (UTC)
Date: Fri, 18 Oct 2019 09:39:41 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1403291253.6979626.1571405981736.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191018133733.GA31681@dell5510>
References: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
 <20191018133733.GA31681@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.7]
Thread-Topic: mlock_8-1, munlock_10-1: don't use LONG_MAX as invalid pointer
Thread-Index: iVXigk1YNIpfhIeF+RuvYI2JVR/TlA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 18 Oct 2019 13:39:41 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mlock_8-1,
 munlock_10-1: don't use LONG_MAX as invalid pointer
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
> Hi Jan,
> 
> > arm64 kernel with commit 057d3389108e ("mm: untag user pointers passed to
> > memory syscalls") will assume this is tagged user pointer and will
> > attempt to clear first byte. This leads to test hitting different error
> > (EINVAL instead of ENOMEM).
> 
> > Add a helper function which provides invalid/unused pointer from user
> > address space.
> 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks, discussion in:
  http://lists.linux.it/pipermail/ltp/2019-October/013993.html
is still going, so maybe this will be fixed on kernel side
after all.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
