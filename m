Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A36D9505
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Apr 2023 13:24:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25DFC3CC73A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Apr 2023 13:24:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 07FDB3C0041
 for <ltp@lists.linux.it>; Thu,  6 Apr 2023 13:24:21 +0200 (CEST)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 445E11400E65
 for <ltp@lists.linux.it>; Thu,  6 Apr 2023 13:24:19 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FF9E5C00C9;
 Thu,  6 Apr 2023 07:24:18 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 06 Apr 2023 07:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1680780258; x=1680866658; bh=Gq
 C0msXUkih9ZXzN6e7GwneaPTqnO4vnHWEtU6Y291I=; b=CXXIGJFVUBMwtAjLnp
 kmF10Zfxfr631SRdhfKgwQh+ULwP+arHVY/Q2o5d+Sz9uZu2foTRaLB5dXiW1yyx
 SkodDp49FghSHp2I8e0VygrKOLHRqPFizdJy7Y7UuZEZHLvKELp+3i5crOAjVGhg
 oml7+vH8jkpaoTcv4jqVNC83UCeuSp3+LOjjLgDPmcNjiiitNBPFfA3Vj2Xav8pk
 Qxg3zvT45pmTWyIwM+iUgg1yWO9X4Fntvw9Ouf6uPd/5sBsfaeH3/i9i6UJOqsCh
 Xn1OpYeXhPGPls+mlVenzOilPj7ansHZgCR/8/aCJQp9qbmB3s7qgkwJjuxOL99v
 ZLKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680780258; x=1680866658; bh=GqC0msXUkih9Z
 XzN6e7GwneaPTqnO4vnHWEtU6Y291I=; b=DzBgP5N9tzBpd8kNcfqKNGyFddW34
 dOLdkdA0dILtzyrrPHBWH+tf+b9sHy1ux2zBy9YT+Zz6JzcQOJ/g4amaBuj7HI8D
 //Yj4Pm8FCtr6aGMRIVwhGJXvetGTQR6ZCcO0a2ECuT57r3Nr6/XSrPXovuCe0XF
 HG7IR9EVuGrMX/KaeZG/4ehe07+eIfjcYL9VN6tNXUNvXawVKOdt/Is/4rjVwhE/
 XsgAmyI7ZOSmaDOiAHJ5Y3qMF45DF6K3G/EXiAziQuF+YMIV6PO1xZaZu02/iS4t
 KfEt5wdETeseQaptyGMLauoZ2hZ3gWXnqIqC6zHHgsW3mulVig34dw3Yw==
X-ME-Sender: <xms:4asuZLbu6dbDL9QI-ji9iiGUeSqq0nGIef2_G7_s9gQHBTYucDJF6g>
 <xme:4asuZKZD0NnnHWyn_zhNSJgGUHgtq14tnGDtGJJ6z-JGFe4F8YUg3gVQVQ2BGu4xL
 6kdgEqpUaXtEv9xKxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:4asuZN9J3CLK4Qj7D861SnSnFB20ziqnzGrk6yFlarwexWbCqU3hhQ>
 <xmx:4asuZBo6oYJ_pTS0dpGyz10SA2oOBmPR4EccqPZWOic7bCx9rhHwOg>
 <xmx:4asuZGrdFNHgtx9VB1uwx1NPsGB3gw6PSWyz7pEZ2hQjY-E0LjfiIg>
 <xmx:4qsuZCdoPeP9U9PXBpKPVsKJTITTWGudzVUURAGbxFvw0xTFSXLEUQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 961AEB60093; Thu,  6 Apr 2023 07:24:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <7234b8ab-db5c-4f4a-bb9e-ddef9f1a50d3@app.fastmail.com>
In-Reply-To: <20230406105646.GB1545779@pevik>
References: <CA+G9fYtVXsKSbdxcTNiLc8oYRTBOZzWNQRF92daLE58NPbOkFg@mail.gmail.com>
 <96b67ae8-98dd-40fe-9dde-302e09d12551@app.fastmail.com>
 <20230406105646.GB1545779@pevik>
Date: Thu, 06 Apr 2023 13:23:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Petr Vorel" <pvorel@suse.cz>, "Naresh Kamboju" <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP: list of failures on 32bit and compat mode
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
Cc: Benjamin Copeland <ben.copeland@linaro.org>, llvm@lists.linux.dev,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Apr 6, 2023, at 12:56, Petr Vorel wrote:
>> On Thu, Apr 6, 2023, at 11:11, Naresh Kamboju wrote:
>
>> > mq_timedreceive01
>> > mq_timedreceive01.c:197: TPASS: mq_timedreceive() failed expectedly: EINTR (4)
>> > tst_test.c:1581: TBROK: Test killed by SIGSEGV!
>
>> I think this is the same problem as fstatfs02, where ltp passes
>> an invalid pointer and expects EFAULT, but musl touches the data
>> first in order to do the time64 conversion. Needs the same fix.
>
> FYI mq_timedreceive01 is broken on 32bit systems with glibc
> (in current LTP master):
>

> EINTR (4)
> tst_test.c:1618: TBROK: Test killed by SIGSEGV!

Right, I see this has the same time64 logic as musl now.

>> > recvmmsg01.c:92: TPASS: recvmmsg() overflow in nanoseconds in timeout
>> > : EINVAL (22)
>> > tst_test.c:1581: TBROK: Test killed by SIGSEGV!
>
>> Same time64 conversion issue as above.
>
> Besides the same problem with shm permissions on musl I see SIGSEGV also on
> 64bit musl on current LTP master.

Ah, I see. This must be the padding code then, not the time64
conversion:

+int recvmmsg(int fd, struct mmsghdr *msgvec, unsigned int vlen, unsigned int flags, struct timespec *timeout)
+{
+#if LONG_MAX > INT_MAX
+       struct mmsghdr *mh = msgvec;
+       unsigned int i;
+       for (i = vlen; i; i--, mh++)
+               mh->msg_hdr.__pad1 = mh->msg_hdr.__pad2 = 0;
+#endif


       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
