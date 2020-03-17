Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0A9189052
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 22:29:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6AA53C55D5
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 22:29:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 454633C0E5E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 22:29:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BFCB56005D2
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 22:29:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44412ABDC;
 Tue, 17 Mar 2020 21:29:14 +0000 (UTC)
Date: Tue, 17 Mar 2020 22:29:12 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <20200317212912.GA4871@dell5510>
References: <20200313062058.7058-1-vikas.kumar2@arm.com>
 <20200313062058.7058-2-vikas.kumar2@arm.com>
 <20200317205950.GB22450@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317205950.GB22450@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Added Refrence for Linux Asynchronous IO APIs
 in LTP
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it, anshuman.khandual@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Vikas,

I did most of formatting cleanup for you, you can use it as a base for v3:
https://github.com/pevik/ltp/tree/Vikas_Kumar/io_uring.v2.fixes

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
