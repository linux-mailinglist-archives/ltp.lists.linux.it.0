Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5011F3C83C3
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 13:21:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05E353C7565
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 13:21:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 314163C874A
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 13:21:24 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5F01F1000F2D
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 13:21:23 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.68.141])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A46669F87B;
 Wed, 14 Jul 2021 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626261681; bh=PteDfiES1uwbhdK+M1xnzCYBrzx2zxLFczHNoMRawa0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=SyGTccokmvRHVfaONXLWlUseUJuuggx1L2I8/Xf3Kgtp3Y1tseMmpE18di6B6FJS/
 m2DMx9nnYTgCazUvmSQ0xSpmubvQBiWrAgTyJvR6/4qkPq1/KW/KRMo4JUTcuWkBHu
 FXcBEjzRVysjCHKKxmLzoNsLlupw0USBl+5YoAc8=
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-2-rpalethorpe@suse.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <36430750-17c9-06e4-0f49-efc744116154@jv-coder.de>
Date: Wed, 14 Jul 2021 13:21:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714071158.15868-2-rpalethorpe@suse.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/8] Add Sparse based checker and TST_RET/ERR
 check
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,


On 7/14/2021 9:11 AM, Richard Palethorpe via ltp wrote:
> Vendors in Sparse as a git module. Then uses it to check for stores to
> TST_RET/ERR within the library.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>   .gitmodules             |   3 +
>   tools/Makefile          |   2 +
>   tools/sparse/.gitignore |   1 +
>   tools/sparse/Makefile   |  27 ++++++++
>   tools/sparse/README.md  |  38 +++++++++++
>   tools/sparse/main.c     | 148 ++++++++++++++++++++++++++++++++++++++++
I think the name could be a bit better... sparse_main or ltp_checker or 
something, because a binary just called main could be confusing.

Otherwise good basis for additional checks and fixing the warnings 
emitted by sparse will allow use to raise the overall warning level.
Hopefully at some point at least "-Wall -Werror" is possible.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
