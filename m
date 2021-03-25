Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3D3498C5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 18:55:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A1873C5FC5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 18:55:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 424E33C2E1A
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 18:55:44 +0100 (CET)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 48F521A011C3
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 18:55:44 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1616694942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNbiGGnvlAl57iwhF/VDCo8GHxOkRS0/W0QutwgSyhI=;
 b=mTxi4UL05VaerFfKcKou9M8yGT3e8D1hO3la7xMZinEAIXOZiiDi62KrX/eSNcrdSmyJgy
 Q3F2bLMixneoEgJ79SdSN2K3qaK/SUfT/wzH8FKyrbDkMRW7U9lrvWLR2Ufwb/g+OmyaZz
 AckXK3Eq0O08sAnRRXkCMWV8BYzrAAbupXIby3lD5Gzc8hX5LKIJez0LrwhflJIt8dQUnO
 Gwi+FWeVsuM3b0o69fDBFhxcK3ZrTPGKPRZQypUE3x9Fozr5wYlCPbwL3WtCkUBVkSPZyN
 Ldu2kTt9YqvLovBXyPafCn15CQRdhP3VA8A9e0ejzE0J4+Cvg/uKpiZxI8W0/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1616694942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNbiGGnvlAl57iwhF/VDCo8GHxOkRS0/W0QutwgSyhI=;
 b=ymd2Br2CLWxwB3KSPpw3BK9FkQ9t5owK+Fmj6H9OpK3RRnBeWbujZ1yjedLJ+9DBvkQwRB
 wtqzQjCk0LySiDCA==
To: Heiko Carstens <hca@linux.ibm.com>, Li Wang <liwang@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
In-Reply-To: <20210323215819.4161164-4-hca@linux.ibm.com>
References: <YFmUrVOyX4q+8Dy9@osiris>
 <20210323215819.4161164-1-hca@linux.ibm.com>
 <20210323215819.4161164-4-hca@linux.ibm.com>
Date: Thu, 25 Mar 2021 18:55:41 +0100
Message-ID: <87sg4jw21u.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] lib/vdso: remove struct arch_vdso_data from
 vdso data struct
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
Cc: linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Mar 23 2021 at 22:58, Heiko Carstens wrote:
> Since commit d60d7de3e16d ("lib/vdso: Allow to add architecture-specific
> vdso data") it is possible to provide arch specific VDSO data.
>
> This was only added for s390, which doesn't make use this anymore.
> Therefore remove it again.
>
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>

Please route that with the rest of the fixes.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
