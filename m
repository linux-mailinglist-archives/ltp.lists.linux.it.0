Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12310164598
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:35:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB0613C24C6
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:35:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 77A5C3C2092
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:35:54 +0100 (CET)
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 315756014A9
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=YhkJs
 JNtKD35jEtTT42e6jv+t5uMpUlovNN/mTdlxHE=; b=NtaJrgzxAF6vEZfdxO+bP
 86SeShutvD3+9HW+QJUK9frCZTS3o///hqgixRlp1npqwLK6YYMeGDxCH2exjaUk
 Vbq11cZUaLZuSVud52uHwysW9HwMqM1U9WmhGrBDGG9vBSl2HdqZtISqaGV6cudu
 1ldYTUa/+WRmmcyNW3LQuM=
Received: from [172.20.10.4] (unknown [122.96.42.253])
 by smtp3 (Coremail) with SMTP id G9xpCgB30ceyOU1ewUbuCw--.4248S2;
 Wed, 19 Feb 2020 21:35:46 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: Li Wang <liwang@redhat.com>
References: <20200218115918.32203-1-liwang@redhat.com>
 <0774e1e5-c326-e4aa-8c74-45de61d8276b@163.com>
 <CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com>
 <701290c2-4cd6-154a-d400-7479c57ec910@163.com>
Message-ID: <d9fbb16b-e3c3-b66f-58ed-99310ff394c8@163.com>
Date: Wed, 19 Feb 2020 21:35:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <701290c2-4cd6-154a-d400-7479c57ec910@163.com>
Content-Language: en-US
X-CM-TRANSID: G9xpCgB30ceyOU1ewUbuCw--.4248S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUhiL0UUUUU
X-Originating-IP: [122.96.42.253]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0hTOXlUMUaT6FwAAsX
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: avoid to generate many redundant obj
 files
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

On 2/19/20 9:07 PM, Xiao Yang wrote:
>
> You can build and link libswapon.c directly, as below:
>
> ---------------------------------
>
> # grep MAKE_TARGETS Makefile
> $(MAKE_TARGETS): %: ../swapon/libswapon.c
>
> ---------------------------------
>
> Sorry, I am not sure if your improvement is the best way.
>
Hi Li,

The root cause is that libswapon.c is built as an object 
file(libswapon.o) instead of a library file(libswapon.so/libswapon.a).

Sorry, I just feel strange about the left *.o files.

Thanks,

Xiao Yang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
