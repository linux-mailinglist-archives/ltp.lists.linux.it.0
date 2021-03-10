Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A12EA33406A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:37:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 342313C6A24
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:37:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D34923C0154
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:37:36 +0100 (CET)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C8AA36013A0
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:37:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=CN8jF
 YtYjm6aBpozYgyY8yaDriE0w2bcrmbMNr+PJCo=; b=NEZLaaKFusK9U3D3+VsoO
 QeVrHDHNR/HvqYXg3qZ6lDQpm7aKcMEnRW/rktANOf7wrt8yt5cw13wNyP0v6F8C
 F1DkjvUdilDxtEiaSGFeUfzRgRsCDnf/pObz8cPiRONSh+3vGxjs7oBJKX+qNJ05
 VF4LOQKixIKvM7CvJn7NVk=
Received: from [172.20.10.4] (unknown [122.192.13.185])
 by smtp5 (Coremail) with SMTP id HdxpCgB3KDSm2UhgRwAeBA--.5101S2;
 Wed, 10 Mar 2021 22:37:27 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20210303043014.484426-1-yangx.jy@cn.fujitsu.com>
 <YEii0cWus+XI8GkB@pevik>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <c13cb5b8-7aa6-e6bc-230a-767a5c134201@163.com>
Date: Wed, 10 Mar 2021 22:37:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YEii0cWus+XI8GkB@pevik>
Content-Language: en-US
X-CM-TRANSID: HdxpCgB3KDSm2UhgRwAeBA--.5101S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsdgAUUUUU
X-Originating-IP: [122.192.13.185]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiOwpRXlXlrYMd-gABsC
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] docparse/docparse.c: Make docparse check
 implied flags recursively
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

Hi Petr,

Thanks for your review and pushed the patch set.

Best Regards,

Xiao Yang

On 3/10/21 6:43 PM, Petr Vorel wrote:
> Hi Yang,
>
>> Current docparse cannot check implied flags recursively.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Thanks!
>
> Kind regards,
> Petr
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
