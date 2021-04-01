Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539B351477
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 13:30:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 631183C77B9
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 13:30:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8BD093C0F87
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 13:30:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1B0AA200914
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 13:30:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5898CB2E7;
 Thu,  1 Apr 2021 11:30:08 +0000 (UTC)
Date: Thu, 1 Apr 2021 13:30:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Message-ID: <YGWuvhyizr97S7Cu@pevik>
References: <20210315092844.991073-1-lkml@jv-coder.de>
 <20210315092844.991073-2-lkml@jv-coder.de> <YGLhmNUg/JMrWjqt@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGLhmNUg/JMrWjqt@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] pec: Fix multiple event test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,


> I was not able to run this test without failures (using your original test, just
> adding missing SAFE_EXECV(), see logs below.

Merged this one. Thanks for your work.

Could you please send v2 for the second patch?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
