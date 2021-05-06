Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0DD375155
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 11:15:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2DB63C56C1
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 11:15:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 392533C1C23
 for <ltp@lists.linux.it>; Thu,  6 May 2021 11:14:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E40F514012A7
 for <ltp@lists.linux.it>; Thu,  6 May 2021 11:14:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A334B17E;
 Thu,  6 May 2021 09:14:57 +0000 (UTC)
Date: Thu, 6 May 2021 11:14:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>, zohar@linux.ibm.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YJOzjw0k+ZgWaQO3@pevik>
References: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
 <20200928035605.22701-3-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928035605.22701-3-tusharsu@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] IMA: Add test for dm-crypt measurement
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
Cc: snitzer@redhat.com, dm-devel@redhat.com, agk@redhat.com,
 linux-integrity@vger.kernel.org, gmazyland@gmail.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tushar, Mimi, Lakshmi,

> New functionality is being added to IMA to measure data provided by
> kernel components. With this feature, IMA policy can be set to enable
> measuring data provided by device-mapper targets. Currently one such
> device-mapper target - dm-crypt, is being updated to use this
> functionality. This new functionality needs test automation in LTP.

> Add a testcase which verifies that the IMA subsystem correctly measures
> the data coming from a device-mapper target - dm-crypt.

I noticed v10 patchset [1] has been merged, including SELinux commit
fdd1ffe8a812 ("selinux: include a consumer of the new IMA critical data hook"),
thus I merge this patchset.

I suppose fdd1ffe8a812 is the commit which should be mentioned in
ima_dm_crypt.sh, right? (the only change to v3 [2])

Kind regards,
Petr

[1] https://lore.kernel.org/linux-integrity/20210108040708.8389-1-tusharsu@linux.microsoft.com/
[2] https://patchwork.ozlabs.org/project/ltp/list/?series=230766&state=*

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
