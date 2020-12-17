Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80A2DCF01
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:02:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04ECB3C57CC
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:02:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BAD303C299B
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:02:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4B1011A013C1
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:02:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56E93AC7B;
 Thu, 17 Dec 2020 10:02:29 +0000 (UTC)
Date: Thu, 17 Dec 2020 11:03:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <X9ss72KD3nyaxLbW@yuki.lan>
References: <b48115a8d6dc3036f08e0166332035fab078b34a.1608189944.git.viresh.kumar@linaro.org>
 <50d28b5f804ee13cf4efca28cbd0b2d08929d46a.1608189944.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50d28b5f804ee13cf4efca28cbd0b2d08929d46a.1608189944.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/3] syscalls: init_module: Add tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with two small fixes, thanks.

* Added dummy call to tst_module_exists() to the setup()s
  which causes the test to exit with TCONF if the module wasn't build
  for example when kernel devel package wasn't installed

* Cleaned up a bit the init_module02.c run() function

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
