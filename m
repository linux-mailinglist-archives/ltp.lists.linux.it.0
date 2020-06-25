Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AD209E7F
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 14:34:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 633FC3C58CA
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 14:34:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CEB013C2CA5
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 14:34:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F93C6008A2
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 14:34:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54C45AC90;
 Thu, 25 Jun 2020 12:34:35 +0000 (UTC)
Date: Thu, 25 Jun 2020 14:34:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20200625123456.GE23637@yuki.lan>
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
 <a1189d10-1539-2486-3d78-ede985d0f79e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1189d10-1539-2486-3d78-ede985d0f79e@ti.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_test: Add support for device discovery
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I think we a need:
> 
> 1) A common way to define Hardware capabilities, i.e. UART_RX and 
> UART_TX in your example.
> 
> I suspect for device-driver tests, ltp would be called by a test 
> automation framework. It should be the test automation framework 
> responsibility to setup the equipment per the HW capabilities requested 
> by the test.
>
> So from ltp point of view, the only requirement is to advertise the 
> required capabilities. Of course, this implies a common understanding of 
> the capabilities' tags.

I do agree here, but this will not work until we have the metadata
export in place. Once we have the infrastructure to generate the
description of the tests the test automation will simply load the JSON
file and then run tests and reconfigure the hardware between loops as
needed.

But that would mean that we will not have an upstream solution until we
get rid of ltp-pan and runtest files. This is fine with me as I actually
want to get the metadata generator in LTP tree soon enough.

> 2) A way to set platform-specific values when required. Ideally the test 
> logic can figure out the values to use dynamically but for some test 
> cases, it is required to statically defined them based on the platform 
> the test is running on.
> 
> In ltp-ddt we added this functionality as platform overrides 
> http://arago-project.org/git/projects/?p=test-automation/ltp-ddt.git;a=blob;f=README-DDT;h=78b79cd3ca0f66a6ef30b5dc05737188c146a9ca;hb=HEAD#l46, 
> borrowing an idea from OE/Yocto world. I think a different approach 
> where these info is maintained in a separate file with an API that it is 
> called by the test case logic would work. However, I think that this 
> information is not lab-specific but board-specific and it should be part 
> of ltp.

I'm not convinced that this belongs to LTP git but we can setup a shared
git repo for platform descriptions if things go well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
