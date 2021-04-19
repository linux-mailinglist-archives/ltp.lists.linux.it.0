Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C085E363AA0
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 06:43:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9184C3C6D5B
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 06:43:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B39103C19DA
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 06:43:37 +0200 (CEST)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0796510006BE
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 06:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=rx59L
 jL6bVuemKBvFJnSUV7rTs0EFH1+fN70E8F06dw=; b=nqxCqpBYG7suUw9oqt+xX
 /OOMjHS+quEmhKEbvsBTfUtrdCpaSun39jc0dm8Yti7obrU4WGCO53PEBapXQs5m
 Nxxs1H6+V3de2YBCbKnOVA+TAehH0vXYYHtoMTO7E1hsvk6g1FElUMXJe2372QUV
 29eMc/2FXFc1uhGyuI02DA=
Received: from [172.20.10.4] (unknown [122.96.44.167])
 by smtp5 (Coremail) with SMTP id HdxpCgAXFRpzCn1gHtyDCg--.277S2;
 Mon, 19 Apr 2021 12:43:32 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
References: <20210419023845.19140-1-ice_yangxiao@163.com>
Message-ID: <41bf272d-9821-76c8-abb5-e2d17e122c36@163.com>
Date: Mon, 19 Apr 2021 12:43:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210419023845.19140-1-ice_yangxiao@163.com>
Content-Language: en-US
X-CM-TRANSID: HdxpCgAXFRpzCn1gHtyDCg--.277S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4fXw4UWF4rGw13AFWDJwb_yoWDJrg_Ca
 sxCryv9w4rWFn3ta9IkFyfXr4jkw4kCF1rZF18Jwn7GryDtwn8JrZ3Jr97Wrs8G39xGFy8
 tFyfZrWIq3W2yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0n2-7UUUUU==
X-Originating-IP: [122.96.44.167]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEhR5Xl6ibm2a-QAAs5
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] include/tst_test_macros.h: Add TST_EXP_PID
 and TST_EXP_PID_SILENT macros
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

Hi

Please ignore the patchset and see the latest v2.

Thanks,

Xiao Yang

On 4/19/21 10:38 AM, ice_yangxiao@163.com wrote:
> From: Xiao Yang <yangx.jy@fujitsu.com>
>
> Signed-off-by: Xiao Yang <yangx.jy@fujitsu.com>
> ---
>   include/tst_test_macros.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 189891507..101ac2c87 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -77,6 +77,17 @@ extern void *TST_RET_PTR;
>   				#SCALL, ##__VA_ARGS__);                        \
>   	} while (0)
>   
> +#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_FD_SILENT(SCALL, __VA_ARGS__)
> +
> +#define TST_EXP_PID(SCALL, ...)                                                \
> +	do {                                                                   \
> +		TST_EXP_PID_SILENT(SCALL, __VA_ARGS__);                        \
> +									       \
> +		if (TST_PASS)                                                  \
> +			TST_MSGP_(TPASS, " returned pid %ld", TST_RET,         \
> +				#SCALL, ##__VA_ARGS__);                        \
> +	} while (0)
> +
>   #define TST_EXP_PASS_SILENT(SCALL, ...)                                        \
>   	do {                                                                   \
>   		TEST(SCALL);                                                   \


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
