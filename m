Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8203FC07F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:35:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8097C3C9B59
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:35:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 23EA53C2B34
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:35:09 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 751B710007BB
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:35:06 +0200 (CEST)
X-QQ-mid: bizesmtp46t1630373693t2idf1x3
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 31 Aug 2021 09:34:52 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: C2aJ/mFmrmSLrTILTfaJEhrHnPiQ4ScgpDxC1QsqgeV5AxKWFDyOK5SwM1WTV
 vs4Yp+CjD0LQTciMD6Vgf2ffttrj9EUfyYHCDgxP5oq5fv3LvvA/7XMvQY63QI6SaXhnF0Y
 NaxOPBmprJzSEIICWLy+fRJcFsilGR8MxyFCWCMEofddXkMBSOr1NNpIOb/63MIWZg08L6C
 qx0XdYbYhDPrnuP1SaLkmyiHUFy0uVbd6Zbzdssore6dF5BpAurzzhvDAzPbiIOZMcw18CN
 APng66Yz8VY4Ue/crdtsBGFmUuNrfWxTJl/DSFSkIEDAQ8VFogshEt3jJM5IBsHy7bWzeCb
 2bNFopb
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210830073544.19620-1-zhanglianjie@uniontech.com>
 <YSzovuplDWPu6GZ7@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <edf46b6e-1a35-f037-2b8d-17666a8ed184@uniontech.com>+666F0916749A3C17
Date: Tue, 31 Aug 2021 09:34:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YSzovuplDWPu6GZ7@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_test_macros: Add test_macros06 tests
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
Yes, I will submit the patch, thank you.

On 2021-08-30 22:18, Cyril Hrubis wrote:
> Hi!
> Can we please add the macro expansion test to the test_macros05 as well?
> 

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
