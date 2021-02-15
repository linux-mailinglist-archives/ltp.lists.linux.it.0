Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7B831B664
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 10:27:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 238FA3C676A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 10:27:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 136FB3C30D0
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 10:27:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 08F1A600835
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 10:27:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2CABCACD9;
 Mon, 15 Feb 2021 09:27:27 +0000 (UTC)
Date: Mon, 15 Feb 2021 10:27:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YCo+fdFmRJwu2UFE@pevik>
References: <20210125131746.74630-1-lkml@jv-coder.de>
 <e573f919-8205-40e2-5187-49bff0983872@jv-coder.de>
 <YBG4hFVo5wdaFnPa@pevik>
 <f4ee229f-ea33-cbdd-5dbe-889e16629ed1@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4ee229f-ea33-cbdd-5dbe-889e16629ed1@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg/functional: Convert to newlib
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> I'd like to submit some more patches on top of this.

You probably noticed some failures (on 5.10.14 openSUSE kernel):

memcg_stat_rss, memcg_subgroup_charge, memcg_move_charge_at_immigrate, memcg_stat:
TBROK: timed out on memory.usage_in_bytes
=> maybe just timeout?

memcg_max_usage_in_bytes
memcg_max_usage_in_bytes_test 1 TFAIL: memory.max_usage_in_bytes is 4325376, 4194304 expected
memcg_max_usage_in_bytes_test 2 TFAIL: memory.memsw.max_usage_in_bytes is 4325376, 4194304 expected
memcg_max_usage_in_bytes_test 3 TFAIL: memory.max_usage_in_bytes is 4325376, 4194304 expected
memcg_max_usage_in_bytes_test 3 TFAIL: memory.max_usage_in_bytes is 126976, 0 expected

memcg_usage_in_bytes
memcg_usage_in_bytes_test 1 TFAIL: memory.usage_in_bytes is 4325376, 4194304 expected
memcg_usage_in_bytes_test 2 TFAIL: memory.memsw.usage_in_bytes is 4325376, 4194304 expected

Tests which needs further cleanup/rewrite (less important than fixing previous)
testcases/kernel/controllers/memcg/regression/memcg_regression_test.sh
testcases/kernel/controllers/memcg/regression/memcg_test_4.sh
testcases/kernel/controllers/memcg/control/memcg_control_test.sh

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
