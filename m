Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60A6EF3E6
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Apr 2023 14:01:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4907C3CBB5B
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Apr 2023 14:01:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B1D73CBB51
 for <ltp@lists.linux.it>; Wed, 26 Apr 2023 14:01:00 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 22A052009A4
 for <ltp@lists.linux.it>; Wed, 26 Apr 2023 14:00:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9D3E4B3;
 Wed, 26 Apr 2023 05:01:40 -0700 (PDT)
Received: from [10.1.27.36] (e126380.cambridge.arm.com [10.1.27.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 674773F5A1;
 Wed, 26 Apr 2023 05:00:56 -0700 (PDT)
Message-ID: <e5ee14bc-9f65-877f-38bc-c49896488eac@arm.com>
Date: Wed, 26 Apr 2023 13:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20230420160910.809091-1-teo.coupriediaz@arm.com>
 <ZEkOWeUze71J3x/7@yuki>
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
Organization: Arm Ltd.
In-Reply-To: <ZEkOWeUze71J3x/7@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.4 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/2] setpgid: Test EPERM error paths more
 reliably
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26/04/2023 12:43, Cyril Hrubis wrote:
> Hi!
> Both pushed, thanks.
>
Hi Cyril,
Thanks a lot !


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
