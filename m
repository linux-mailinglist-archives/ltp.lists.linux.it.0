Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19B363F6D
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 12:17:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3971D3C6DC4
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 12:17:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63F8F3C1B51
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 12:17:17 +0200 (CEST)
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A637B1000367
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 12:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=w6rjq
 +Ti0dZXZMJjqKA313AT+hk2lGEabZtW+L+V93M=; b=RngRaCTe6LQQJ6DN7lRhV
 mrr6ZundMwOZSP/Q/2BrwBZVwfLHRy73/UGhsB7CdaUqbwbm518s3ANB9713YSbO
 rYGx9OXIUNwI3NHOloAbtKI30M5sHDSvrGISNQl4SzYe+TrrzGqcgr8TkxjHosmg
 DPV0Jj6Nzu6zZeVN/ImALw=
Received: from [172.20.10.4] (unknown [122.96.44.167])
 by smtp3 (Coremail) with SMTP id G9xpCgA3xxajWH1gTtvPDg--.21S2;
 Mon, 19 Apr 2021 18:17:08 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210419044112.31443-1-ice_yangxiao@163.com>
 <YH1EJ8BmbYTBOvdk@yuki>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <70c0c22a-97ba-a647-9ae8-998e2469927e@163.com>
Date: Mon, 19 Apr 2021 18:17:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YH1EJ8BmbYTBOvdk@yuki>
Content-Language: en-US
X-CM-TRANSID: G9xpCgA3xxajWH1gTtvPDg--.21S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIEdyUUUUU
X-Originating-IP: [122.96.44.167]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0gR5XlUMbPXKIAAAsb
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] include/tst_test_macros.h: Add TST_EXP_PID
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Thanks, pushed with your suggestion(use TST_EXP_POSITIVE).

Best Regards,

Xiao Yang

On 4/19/21 4:49 PM, Cyril Hrubis wrote:
> Maybe we should rename the TST_EXP_FD_SILENT() to TST_EXP_POSITIVE() and
> then define both TST_EXP_PID_SILENT() and TST_EXP_FD_SILENT() based on
> TST_EXP_POSITIVE(), but that's very minor.
>
> Looks good to me:
>
> Reviewed-by: Cyril Hrubis<chrubis@suse.cz>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
