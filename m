Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7135415AAD
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 11:15:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54B5A3C8F66
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 11:15:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 90E3B3C8F57
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:15:11 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E1ABA1001286
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:15:08 +0200 (CEST)
X-QQ-mid: bizesmtp33t1632388501t0o1q0db
Received: from [10.4.23.19] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 23 Sep 2021 17:15:00 +0800 (CST)
X-QQ-SSF: 0140000000000040C000000B0000000
X-QQ-FEAT: g1CXZ3gRPwwLQMjuvi6Ak/tUz7p+Emr2HNsY20pu1x3AZQSKVRowM1SfmyJ8g
 +oDaCSQ4YiPb3KzEJzGLed2jm4Gc3cAv4lR0mtZEDKAKxIDJdocG9bW8hVZE4wX+9vZWxSA
 IROz5wFkZdq5yF2rAchQFrSInpO9b9cfBuuXf6PelguPqPQbW3DXQf6+v3dW+ocLp/X1Jcf
 9e/cwwox6riyrANTZzTPijRz0diGXG6Fdgh9xCVjJkwRD7y6puomhQLnXOEUMQs8dQ4KBct
 KpubE60oO486YTr+ePPWGfm2UAhnewTL0Wj+oAFHvH055ty6IPRJ/rfDGljxGZb9y0I9wQo
 rC5QAOeHyIrIKbD29ggelhrvfdtrlntQKxdGIbp
X-QQ-GoodBg: 2
To: Petr Vorel <pvorel@suse.cz>
References: <20210902010814.32448-1-zhanglianjie@uniontech.com>
 <YTBo6ZS2GKWb8edF@pevik> <c0a5fa20-dd40-161c-352f-407b8a2d6b08@uniontech.com>
 <YUxDQBYdEXdf5RPf@pevik>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <5f3c73e2-3361-9b9a-5359-79afe87a11be@uniontech.com>+EDA5AA9D33C97A9F
Date: Thu, 23 Sep 2021 17:14:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YUxDQBYdEXdf5RPf@pevik>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/7] syscalls/clone01: Convert to new API
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

Oh thank you. ^_^

On 2021-09-23 17:05, Petr Vorel wrote:
> Hi zhanglianjie,
> 
>> Hi,
>> Please ignore other patches about clone testcases and just focus on
>> v3.thanks.
> 
> FYI you can register on our patchwork instance [1] with email you use for
> sending patches and update status of your patches (e.g. set patches to be
> ignored to "Superseded" or "Changes Requested").
> 
> Kind regards,
> Petr
> 
> [1] https://patchwork.ozlabs.org/register/
> 

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
