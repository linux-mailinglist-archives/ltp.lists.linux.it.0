Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6631B549
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 06:37:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56EE83C6769
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 06:37:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A4BE53C5994
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 06:37:04 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 54E052005CC
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 06:37:04 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id DD6B49F626;
 Mon, 15 Feb 2021 05:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1613367423; bh=GkM0AOdBal+SXv5C7u9zqk1u4RFwdp/Po2aCY3ewA7w=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=kDREfD279kR/FHJ8Cn4hNBJHs+LL9+d86V7W4dx668rBD08DeypLEBPahlMTC66Bs
 AP6BLxFiCeLeG5P/Wu9tVhcY64mVxX6ByK3gw+8/QMJbReCSNg83loceHHe408C0/c
 HXY+F0y7pnYlDcqk6iD/Ru4AzyZPmjGdRhfagM6I=
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>
References: <20210125131746.74630-1-lkml@jv-coder.de>
 <e573f919-8205-40e2-5187-49bff0983872@jv-coder.de> <YBG4hFVo5wdaFnPa@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <f4ee229f-ea33-cbdd-5dbe-889e16629ed1@jv-coder.de>
Date: Mon, 15 Feb 2021 06:37:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YBG4hFVo5wdaFnPa@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg/functional: Convert to newlib
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

> On a first look good cleanup, thank you!
>
> I hope these tests aren't planned to be rewritten to C (like NUMA tests).
> I suppose not, but better to ask earlier.
can this be merged then?
I'd like to submit some more patches on top of this.

J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
