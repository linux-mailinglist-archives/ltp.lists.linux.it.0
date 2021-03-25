Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA103498CC
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 18:57:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 833903C78C8
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 18:57:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A47B43C538E
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 18:57:12 +0100 (CET)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 638C31A002E6
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 18:57:12 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1616695031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aYU/XslC1ugInZNefjNDGx2r98GPcBH1b/Zsq00dTN8=;
 b=Gi/OWlsRoH8hTL+T4t0+0zk2kjHCqKDwpkuw859Yu7h/97u/L+5MEUY4bgPl2kCW9scR85
 RsitZ/HOSfBUB2ZfsXRUi5aOPgcYqUMys9XOCrzN7K72a9NC/yzgT0R7FzidcVIX10ozW0
 WEhe5VbRSVyLFfxaxF7urrIAiTHhk3QBvfKHsuMI6cvFGsKGtFk8P20lL8+zBk4GVzElEp
 LP323c5NGNwjD8f5xXMtgRqDwb8SlYTt1yP6VUNg0ts0WgG7fD/rmt91ZDrjrOChuUlzng
 tBtDgCWm2eDd1cwgp0VRhqf5C8zVFtAtTHkXv0oSv+tbl1FEfTfTFDRaSvnhbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1616695031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aYU/XslC1ugInZNefjNDGx2r98GPcBH1b/Zsq00dTN8=;
 b=qMgylRfM54T8i3UeGik5bja9DFi769SYBCc5ANZBdww3yqDxzvuDdc3qOsH1TuEBwk2A1a
 4jFSe7sz7dX7slBw==
To: Heiko Carstens <hca@linux.ibm.com>, Li Wang <liwang@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
In-Reply-To: <87sg4jw21u.fsf@nanos.tec.linutronix.de>
References: <YFmUrVOyX4q+8Dy9@osiris>
 <20210323215819.4161164-1-hca@linux.ibm.com>
 <20210323215819.4161164-4-hca@linux.ibm.com>
 <87sg4jw21u.fsf@nanos.tec.linutronix.de>
Date: Thu, 25 Mar 2021 18:57:11 +0100
Message-ID: <87pmznw1zc.fsf@nanos.tec.linutronix.de>
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

On Thu, Mar 25 2021 at 18:55, Thomas Gleixner wrote:
> On Tue, Mar 23 2021 at 22:58, Heiko Carstens wrote:
>> Since commit d60d7de3e16d ("lib/vdso: Allow to add architecture-specific
>> vdso data") it is possible to provide arch specific VDSO data.
>>
>> This was only added for s390, which doesn't make use this anymore.
>> Therefore remove it again.
>>
>> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
>
> Please route that with the rest of the fixes.
>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Ah, you decided for the simpler variant. Fine with me.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
