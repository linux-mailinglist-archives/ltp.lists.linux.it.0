Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A51367CFF
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 10:57:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 698563C6AA0
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 10:57:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A81273C1CB7
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 10:57:29 +0200 (CEST)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 642181000761
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 10:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=8MM32
 UHZ9H1WwzuJk2Wki52cECi20DUCFffJ4TMA+cY=; b=bDUMauHAnUafrrSagfviq
 sveefK+lozrSf+2pDit0wRhzi2rGdOKjHGP5MIp77X2dSB8+rmfwZhKmi94HMSLG
 oVl/TQOiGh5vlPfSdu52A98F13ipxnhAOuL4KTLSyqmU2zoj0qvlSK3o9v854SNC
 1vLKYA9hdVik4mEOo8MQXU=
Received: from [172.20.10.4] (unknown [122.96.46.17])
 by smtp5 (Coremail) with SMTP id HdxpCgAHR4t0OoFgVTzWDA--.3027S2;
 Thu, 22 Apr 2021 16:57:24 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <YH7Z8nOX90qjsMpa@yuki> <YIE0INnCJOMGYQQR@pevik>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <fd47c5ca-57f8-c075-bb1d-9fa2c6caae53@163.com>
Date: Thu, 22 Apr 2021 16:57:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YIE0INnCJOMGYQQR@pevik>
Content-Language: en-US
X-CM-TRANSID: HdxpCgAHR4t0OoFgVTzWDA--.3027S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUDZYwUUUUU
X-Originating-IP: [122.96.46.17]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiOxV8XlXlr1AXagAAs+
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] runltp-ng and possible ltp-pan deprecation
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

On 4/22/21 4:30 PM, Petr Vorel wrote:
> Hi Cyril,
>
> Thank you for bringing the discussion to upstream runltp-ng.
>
> I'd prefer to add the project to ltp git, in runltp-ng/ in root directory.

+1

I also prefer to add it into ltp directly.

Best Regards,

Xiao Yang

> And add either a symlink runltp-ng/runltp-ng to the root directory or have a
> shell script which runs it:
> perl -I$(readlink -f $0)/runltp-ng $(readlink -f $0)/runltp-ng/runltp-ng $@
>
> Kind regards,
> Petr
>
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
