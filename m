Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DA3E91A3
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:38:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A7343C7020
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:38:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F9863C5D9E
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:38:02 +0200 (CEST)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1228C10001D2
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:38:00 +0200 (CEST)
X-QQ-mid: bizesmtp38t1628685475tqdf033j
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 11 Aug 2021 20:37:54 +0800 (CST)
X-QQ-SSF: 0140000000200040B000B00B0000000
X-QQ-FEAT: sW6KMCS++a98NRBco4IATQwgW5YpJ/PjRUSEOp8SHhs1mJTcZMzbRVaqZZ4QY
 H4EGks8ve71grfb21P6csVuM/8c3ZcU93LUYgsA/8F2Ju5x2CgHsDebvzZiWjqWeEZVKCbX
 BYvFNEYDFreWj+I2HeE3JgRJZzeA5b3Ezr+Xe2knOiA5R4qN+KCt5E0i54I0LVo0lDQjF+F
 1cQSEPcXjdexlHerT90yzknkUjLmGZcRQUmIgGlyCXsXf2Om59qPKMJ2+Il0WDMm9V8OgGA
 oxZzGXW6ggGQErn+hULvk2FJEv4h9rEZNQRdMX/gVxlrRsp1mnpiEO5qr/HopV1Xz2oDH2N
 WW24Ic2p1M/tE+suxE=
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210810151604.28281-1-zhanglianjie@uniontech.com>
 <YRPCPoaXUIv0npW9@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <2e2cbc2b-c759-c581-4f4d-91b9b3084173@uniontech.com>+5BE3EE894CB5A46D
Date: Wed, 11 Aug 2021 20:37:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YRPCPoaXUIv0npW9@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] syscalls/chmod04: Remove the testcase
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

Hi,
I will pay attention, thanks.

On 2021-08-11 20:27, Cyril Hrubis wrote:
> Hi!
> Here as well, added the reason why we can remove the test to the commit
> message, and pushed, thanks.
> 

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
