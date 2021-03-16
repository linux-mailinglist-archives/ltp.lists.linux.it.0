Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D16EF33D360
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 12:54:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D5C03C6338
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 12:54:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9C4B93C2D4C
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 12:54:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 506F91000A4D
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 12:54:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DC8BAD74;
 Tue, 16 Mar 2021 11:54:09 +0000 (UTC)
Date: Tue, 16 Mar 2021 12:54:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YFCcX8VM2KsMmuQ1@pevik>
References: <20210222023805.12846-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222023805.12846-1-nramas@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Add test for selinux measurement
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: paul@paul-moore.com, selinux@vger.kernel.org,
 stephen.smalley.work@gmail.com, tusharsu@linux.microsoft.com,
 linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lakshmi, Mimi,

> New functionality has been added in IMA to measure data that is
> critical to the integrity of the system.  SELinux uses this feature
> to measure the hash of the SELinux policy loaded in kernel memory,
> and the current state of various SELinux configuration.  This new
> functionality needs test automation in LTP.

> Add test cases which verify that the IMA subsystem correctly
> measures the data provided by SELinux.

I finally merged this patchset, noted both kernel commits.
Thanks for this test!

Kind regards,
Petr

* fdd1ffe8a812 ("selinux: include a consumer of the new IMA critical data hook")
(v5.12-rc1-dontuse)
* 2554a48f4437 ("selinux: measure state and policy capabilities")
(to be in v5.13

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
