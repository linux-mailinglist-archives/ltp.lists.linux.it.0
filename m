Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8556891A29A
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2024 11:25:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 450B03D1294
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2024 11:25:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E36993D0DA4
 for <ltp@lists.linux.it>; Mon, 24 Jun 2024 14:49:45 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=arndb.de (client-ip=103.168.172.145;
 helo=fout2-smtp.messagingengine.com; envelope-from=arnd@arndb.de;
 receiver=lists.linux.it)
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E604E600F36
 for <ltp@lists.linux.it>; Mon, 24 Jun 2024 14:49:44 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 260581380261;
 Mon, 24 Jun 2024 08:49:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 24 Jun 2024 08:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1719233383; x=1719319783; bh=Q8W2Cb9GFW
 M70Zj4xc8kK2Hh9EKM/M/jx4sXVXZP+3s=; b=OAf6pynk2o03dZJWLhP6GDlAxJ
 FMzfO/dvmu5fdm73KzJkM1LnqZGKiKn8CWVYsp3dmTWuDMIBIWoYhh6vr1PW7c6x
 X5LLN/7eWAiAuZTLwhw+VUqqHf/WvPmCXqJDig+xPglKZij5IPl5KtV2yQyAxnsD
 V1GG4MDIVSLDsKwjPsxPmBBV4u9O2xItNLnF0HYeDMjv9qLxKXMYzGjYQ50qHvmA
 N6s5NOtIl699D5DB1/+EIrhDEEBAP+IWmDeno9UkcqBqYZpcufjbu0upHnUzcXr2
 Uwjk1/dGhC556BTXFBhLGJOUYuOfFFx3PBDQarsAG0OBGIbwBX3ZQVy/aeKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1719233383; x=1719319783; bh=Q8W2Cb9GFWM70Zj4xc8kK2Hh9EKM
 /M/jx4sXVXZP+3s=; b=Dq00BKlgKaP2cR5obvsJardd5sHd9Ykq5efCVVGog+nY
 ejg8pe39LicQJvVJMJm98jFZiE0f5sU/BNIAmMZuBWD1s7b8wUOZH7IDRkxnwy9L
 20pktHRucFeYXNE8Ov04HVCEA1mEOvh5mU9lzG3rsABEr3hCEeNYiqzxo9zeIYVR
 T+sGC+SoCmPqOmsC2r1jv3RZbqG/zCeNgo2QrLfN4qSqSFK+KJdLRzqz52+V6OCA
 dw0oNLNkKYuuWhoJa4+CFdfVM2wVo2hJrGCoZ1aiu6zdwVt1SmP5qMy7hluTdjHd
 XTdZ86xdE0oeOHzrvwGoKVglC+HKu92EOVB7LKAx2g==
X-ME-Sender: <xms:ZWt5Zmo9Zflv53gEv_xAYaz3ZgjN2LFMq8ZcaazgXEXKTVDHZjnmRw>
 <xme:ZWt5Zkp-9vYTfxoCtBTsQ_a9xtN_zmiG9sTGVTG72IV7B3s9gCacCtNBhFM2a8QLz
 uG4BdynV8hhJAhxjfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ZWt5ZrOZAiz2nbP-dxzpKXw26eHKJrS1YOSSsbwyBud5s6eAvob2OA>
 <xmx:ZWt5Zl6vGUPX59Lw3lY0Tyt1AdaaAdHcaT0BjBh9fr_8i7EtcLhUdQ>
 <xmx:ZWt5Zl7jaRBngBaLhLO40vwqouxH1t5VOYZFgId6_qSRFoJE-4wUSQ>
 <xmx:ZWt5Zljf6r7CH-Ty6sABQ5-XQgqnuX2oE8HXfOHCkmmOE2ObsTof6g>
 <xmx:Z2t5ZhF7Cw9mWCj0vKv96n8S7QkrlfALxn7h6emOqKQiQkmifdr12eOL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C7FAFB60092; Mon, 24 Jun 2024 08:49:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
MIME-Version: 1.0
Message-Id: <2b46da4c-fbe8-4b97-abf4-96aa7ddc1a9a@app.fastmail.com>
In-Reply-To: <e0e373fa13636a403322fd0ba96915fd25dbbefa.camel@physik.fu-berlin.de>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-10-arnd@kernel.org>
 <366548c1a0d9749e42c0d0c993414a353c9b0b02.camel@physik.fu-berlin.de>
 <9d4ba5e5-bb7f-432e-9354-47cc84eaa9e1@app.fastmail.com>
 <e0e373fa13636a403322fd0ba96915fd25dbbefa.camel@physik.fu-berlin.de>
Date: Mon, 24 Jun 2024 14:49:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Arnd Bergmann" <arnd@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kernel@vger.kernel.org
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 27 Jun 2024 11:23:37 +0200
Subject: Re: [LTP] [PATCH 09/15] sh: rework sync_file_range ABI
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
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-sh@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, stable@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jun 24, 2024, at 08:14, John Paul Adrian Glaubitz wrote:
> On Fri, 2024-06-21 at 11:41 +0200, Arnd Bergmann wrote:
>> On Fri, Jun 21, 2024, at 10:44, John Paul Adrian Glaubitz wrote:
>> > Did you also check what order libc uses? I would expect libc on SuperH 
>> > misordering the
>> > arguments as well unless I am missing something. Or do we know that the 
>> > code is actually
>> > currently broken?
>> 
>> Yes, I checked glibc, musl and uclibc-ng for all the cases in
>> which the ABI made no sense, as well as to check that my analysis
>> of the kernel sources matches the expectations of the libc.
>
> OK, awesome.
>
> Will you send a v2 so I can ack the updated version of the patch?
>
> I'm also fine with the patch going through your tree, as I would
> like to start with the changes for v6.11 this week.

I should be able to get a v2 out today and apply that to my
asm-generic tree to have in linux-next before I send the
pull request.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
