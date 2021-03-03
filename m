Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97532B805
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 14:30:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 653FB3C56EB
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 14:30:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 438213C56A4
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 14:30:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A09CA140099D
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 14:30:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAEA0AE1B;
 Wed,  3 Mar 2021 13:30:38 +0000 (UTC)
Date: Wed, 3 Mar 2021 14:30:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Loviska <mloviska@suse.de>
Message-ID: <YD+PfUQ0ckUtyqse@pevik>
References: <20210303132403.6427-1-mloviska@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303132403.6427-1-mloviska@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Wait for complete input provided by `seq`
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
Cc: Fabian Vogt <fvogt@suse.de>, mloviska <mloviska@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I'd accept this quick fix although Cyril suggested in original PR [1] that
proper solution would be to generate it's input without relying on shell piping
data into it.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/pull/796#issuecomment-789710935

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
