Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 781133FC4B0
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:19:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 481273C2AAC
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:19:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 171FB3C2435
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:19:19 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0D0231A00CBA
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:19:17 +0200 (CEST)
X-QQ-mid: bizesmtp53t1630401552tze3bagr
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 31 Aug 2021 17:19:11 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: VPkm+FfqhV8J4vryER54/KjYKJ0WcMp1389uwRI6OA5ZDUgaqoJ646MDuntMp
 iK52OkFaQAH0v5UfirJeKMLGtAw0VA8uKuujVp6lzpk9Kq7Qevi8cj7bm8mw4Tp24r+szRj
 xPg1zRPZ9naQ06zYa2Q/5JCvoOcEEQwJpoNnpOkCv8Gynkw/zyVd+5TDla2Ao8LwGd1uScz
 jkZnwCslHfDVDYZFPS4zBTNrQJ42JNyFbbXDwdED13A649FVq0pIOhflb+/0qGxWSjZZHdj
 FEzMLr43HHzKFrsvh9CNB3S7WtcXQeYbgjwPJNXHUJKRET9GNDvseHMPrbyax9uoTl6wYu+
 +Ba0ED9drrtqpI3cZ+EEd7jK7Uw5w==
X-QQ-GoodBg: 2
To: Li Wang <liwang@redhat.com>
References: <20210831014358.28459-1-zhanglianjie@uniontech.com>
 <CAEemH2c1cwsxiqg7p+E0NvNg1Qw2j8+mYQYVqre0r1y_LiF9Pg@mail.gmail.com>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <04c5fdac-3930-e160-ab15-45f66a83f401@uniontech.com>+993BC5525893FADA
Date: Tue, 31 Aug 2021 17:19:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2c1cwsxiqg7p+E0NvNg1Qw2j8+mYQYVqre0r1y_LiF9Pg@mail.gmail.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] tst_test_macros.h: Add TST_EXP_VAL macro
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
thank you.

On 2021-08-31 17:01, Li Wang wrote:
> Hi Lianjie, Cyril,
> 
> I have revised the order of the macros and pushed them.
> (put them on the top of TST_EXP_PASS_* to make the whole more readable)
> 
> -- 
> Regards,
> Li Wang

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
