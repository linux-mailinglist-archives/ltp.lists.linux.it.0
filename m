Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9601291A296
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2024 11:25:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A8363D1299
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2024 11:25:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D6353CFCF8
 for <ltp@lists.linux.it>; Mon, 24 Jun 2024 14:37:11 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=arndb.de (client-ip=103.168.172.158;
 helo=fhigh7-smtp.messagingengine.com; envelope-from=arnd@arndb.de;
 receiver=lists.linux.it)
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EB50D2009F2
 for <ltp@lists.linux.it>; Mon, 24 Jun 2024 14:37:09 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 07C5B11400E4;
 Mon, 24 Jun 2024 08:37:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 24 Jun 2024 08:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1719232628; x=1719319028; bh=lFXvov0ksU
 8Pc4ucksxO9SvwB7S7ZcSyst60pbeeZH8=; b=HKfHHn7umsdW+0c1ehuSJQ99eI
 Myjn3JHII41XjBGkBE82U3ZLF1gpqJUHWfu0fD1R2wDTT4O5lDapBn9tPESvQu77
 8adNnRplVreG2sPNDp0X/rfGleHLut9Gk/BSzkxRKhL04EDXsG1YRKgxv6IL6gBV
 hiECEd8aKPxpc7cvdwq2YkiIfftlQjXB9+KAYBuvYvOjmxwZ7/F9l3LRlEL5RFo3
 063MmLg36ab0j12O1asXtLt3D5DVUiK5EvC72HFvCSk3AleE/g7i2STrQpvD5No4
 i+lJKlbqcQQIUGGQGOvBpwpmcMBptK7y9aRt5R4yzWI1IbKl5+ANpAHr7VSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1719232628; x=1719319028; bh=lFXvov0ksU8Pc4ucksxO9SvwB7S7
 ZcSyst60pbeeZH8=; b=SqE/KFUphRWeVMJb+kfwzgwN1/Hu23nlRESAJfYgc8ML
 pUz2mmmI8F5nmEqE+5ox0g/rjJ6d0Zb285uqwFyeJQcQZsscUdL/sXj/UaEluip+
 Y8hGi2uVUqhxSS2j+Tg9/Mp0Zm2wYNokTin+aYRk4BLKmOWC6+/LDFt4sIkWw2DL
 h/Je6x5AernFk742JykHMAJAodzv6NFC7WvmD1gw90TOsbHe5Ze1AinDq0CmjjKA
 Z95MIl9q9aP4NXQ+7dphFhlbY9tl+CfCvo6YBxD12RGqejBt7qQshI8pAPifYgLG
 pqaC18LuaHL4DH+Btw3GZ5ixeMLofnITMxBNO+thYQ==
X-ME-Sender: <xms:cWh5ZrLj7Is9v5gIq1mXIwuK3B6Z67FMFXi_sBM56MqeKqAR64n6TQ>
 <xme:cWh5ZvL6fPST5egK7_VqUyPLzOA0tCn6X6DlKYOektXFx1cgWvkKCjEMrv6PEjXyW
 4yPi_m7QPeT9rWgx9c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cWh5ZjudJI3oixudlca83stC9GtoJPVF-yfqIooUyooPVxKMkRay5w>
 <xmx:cWh5ZkZgIV_EAxNKJdd3dn5ts0jsz0iQNgpwAoaYwIkaiwKIL8UoqA>
 <xmx:cWh5ZiamgC5g2Z463RDvkqIdIU3iA-8c5MxvqJ4odiwM6cjvoG_-fQ>
 <xmx:cWh5ZoB--wGmM0xyN9laN1DWgxiskyw40gTH9IFx_cFQRyZCDpYBHA>
 <xmx:c2h5ZhnZnhgadejE1PelPCjBJhfYQ9s6ZgcSotBgFkM80Ux8nV4bq0wf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 838B9B6008D; Mon, 24 Jun 2024 08:37:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
MIME-Version: 1.0
Message-Id: <eaa0ffaf-e42d-4b86-9eed-534684815cf8@app.fastmail.com>
In-Reply-To: <20240620162316.3674955-15-arnd@kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-15-arnd@kernel.org>
Date: Mon, 24 Jun 2024 14:36:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 27 Jun 2024 11:23:37 +0200
Subject: Re: [LTP] [PATCH 14/15] asm-generic: unistd: fix time32 compat
 syscall handling
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>,
 guoren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linux-sh@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, stable@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Jun 20, 2024, at 18:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> arch/riscv/ appears to have accidentally enabled the compat time32
> syscalls in 64-bit kernels even though the native 32-bit ABI does
> not expose those.
>
> Address this by adding another level of indirection, checking for both
> the target ABI (32 or 64) and the __ARCH_WANT_TIME32_SYSCALLS macro.
>
> The macro arguments are meant to follow the syscall.tbl format, the idea
> here is that by the end of the series, all other syscalls are changed
> to the same format to make it possible to move all architectures over
> to generating the system call table consistently.
> Only this patch needs to be backported though.
>
> Cc: stable@vger.kernel.org # v5.19+
> Fixes: 7eb6369d7acf ("RISC-V: Add support for rv32 userspace via COMPAT")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I had pulled this in from my longer series, but as the kernel
build bot reported, this produced build time regressions, so
I'll drop it from the v6.10 fixes and will integrated it back
as part of the cleanup series.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
