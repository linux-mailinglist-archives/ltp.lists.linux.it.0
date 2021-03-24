Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DD3347399
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 09:26:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3926C3C93B6
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 09:26:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9569D3C93AA
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 09:26:42 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E5C72200923
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 09:26:41 +0100 (CET)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 18716A1DE8;
 Wed, 24 Mar 2021 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1616574400; bh=4JnKaqIIL5unTqnRJ5vl/6BZnfbAqFBkt6v499Osdqs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=nj30W3eakTwE5tSdesGYjktUmDTOF68Q6y2ai6o1Ldlt84fuoepKqJx7sEXyx63tG
 IeU4JjHPFyPaeDRC+IOHy8pDinLEMaVVznQcz3YLRdDg1wstYn5oMD6pTTHFkVl1P4
 A2IkifsCbkCvf9iraFxHc26PZb3yEjB6MPQ4KJ6c=
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
References: <BMXPR01MB2870D7110A3D2AD3DF1B495AEE649@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <cbc294d7-830c-9491-13b1-836be7da043f@jv-coder.de>
Date: Wed, 24 Mar 2021 09:27:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB2870D7110A3D2AD3DF1B495AEE649@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] kdump failure on x86
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 3/23/2021 3:27 PM, Pankaj Vinodrao Joshi wrote:
> Hi,
> i am trying to run kdump on x86 with 5.5.6 kernel but i am getting =

> following errors, can someone please tell whats going wrong here. I =

> have lkdtm config in the kernel and installed kexec-tools as well what =

> could be the cause of issue ???
It looks like the testcase is hopelessly outdated... The jprobe =

interface was removed in linux 4.15 back in 2017 [1]
The tests needs a major rewrite, to work on kernels newer than 4.15.

J=F6rg


[1] =

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D590c845930457d25d27dc1fdd964a1ce18ef2d7d

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
