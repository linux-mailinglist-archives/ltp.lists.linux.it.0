Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 033611993C6
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 12:43:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 504D63C30D8
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 12:43:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C73163C30AA
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 12:42:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4006B10011D5
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 12:42:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86486AF85;
 Tue, 31 Mar 2020 10:42:58 +0000 (UTC)
Date: Tue, 31 Mar 2020 12:42:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <20200331104256.GA12790@dell5510>
References: <20200313062058.7058-1-vikas.kumar2@arm.com>
 <20200313062058.7058-2-vikas.kumar2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313062058.7058-2-vikas.kumar2@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

we decided to take only header and configure.ac as these are valid parts and
good preparation steps. So I removed the test itself and also updated header to
reflect v5.6 changes.
I also dared to remove your Author: line (but kept copyright of course), as Jens
Axboe and other kernel developers are the authors :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
