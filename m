Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B870ACF9
	for <lists+linux-ltp@lfdr.de>; Sun, 21 May 2023 10:27:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D829D3CD3E8
	for <lists+linux-ltp@lfdr.de>; Sun, 21 May 2023 10:27:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A3483CB15E
 for <ltp@lists.linux.it>; Sun, 21 May 2023 10:27:30 +0200 (CEST)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C125B140017C
 for <ltp@lists.linux.it>; Sun, 21 May 2023 10:27:29 +0200 (CEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4QPDGR31Tpz1sClk;
 Sun, 21 May 2023 10:27:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4QPDGQ1Vdnz1qqlS;
 Sun, 21 May 2023 10:27:26 +0200 (CEST)
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id i40Xvq1_k2QN; Sun, 21 May 2023 10:27:25 +0200 (CEST)
X-Auth-Info: 62DN4PYIXwgBhw3rbZVDToaqv0kzKJYyzzOmcs6XzKpkIuCMf4FpoweIZtAimz28
Received: from tiger.home (aftr-62-216-205-204.dynamic.mnet-online.de
 [62.216.205.204])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 21 May 2023 10:27:25 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
 id DE0D61A3C1A; Sun, 21 May 2023 10:27:24 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Paul Eggert <eggert@cs.ucla.edu>
In-Reply-To: <1c688849-f992-029e-30e8-8990c311c8a3@cs.ucla.edu> (Paul Eggert's
 message of "Sun, 21 May 2023 01:19:28 -0700")
References: <lxnjka-9sevacf455zj-1fthj246gvr4-712jsi8w59t4969pqyxmxkaq-l3n4z6dp0ybpuvpiuudtnfot-dl7onwkii2tq8gtprte6cu4fgip6f-ikuh33-a5p9ixcl44cx2h7mimcgl3xt-13bjom.1684553069255@email.android.com>
 <0cb83efa85ae32d956f81e6b9d4966c38fd54bcb.camel@xry111.site>
 <1c688849-f992-029e-30e8-8990c311c8a3@cs.ucla.edu>
X-Yow: -- I can do ANYTHING ... I can even ... SHOPLIFT!!
Date: Sun, 21 May 2023 10:27:24 +0200
Message-ID: <87zg5yqec3.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Increase judgment on buf.
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
Cc: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Peng Fan <fanpeng@loongson.cn>, Carlos O'Donell <carlos@redhat.com>,
 Xi Ruoyao <xry111@xry111.site>,
 Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
 lixing <lixing@loongson.cn>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mai 21 2023, Paul Eggert wrote:

> +	if (tcases[tc_num].exp_err == EFAULT && WIFSIGNALED(status)) {

Can this condition ever be true?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
