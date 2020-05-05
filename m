Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E21C5202
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:36:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 586B23C57EB
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:36:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CD1A53C2241
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:36:40 +0200 (CEST)
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 519ED1A01154
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:36:39 +0200 (CEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jVu0C-00061P-TE; Tue, 05 May 2020 09:36:36 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jVu0C-00058h-Ql; Tue, 05 May 2020 11:36:36 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Christian Brauner <christian.brauner@ubuntu.com>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505083205.qwwdiotmmjl23aje@wittgenstein>
 <87a72m4uqm.fsf@mid.deneb.enyo.de>
 <20200505091554.eq7kzvb4twe2wgvl@wittgenstein>
Date: Tue, 05 May 2020 11:36:36 +0200
In-Reply-To: <20200505091554.eq7kzvb4twe2wgvl@wittgenstein> (Christian
 Brauner's message of "Tue, 5 May 2020 11:15:54 +0200")
Message-ID: <871rny4taz.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [bug?] clone(CLONE_IO) failing after kernel commit commit
 ef2c41cf38a7
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
Cc: Jan Stancek via Libc-alpha <libc-alpha@sourceware.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* Christian Brauner:
>> Have any flags been added recently?
>
> /* Flags for the clone3() syscall. */
> #define CLONE_CLEAR_SIGHAND 0x100000000ULL /* Clear any signal handler and reset to SIG_DFL. */
> #define CLONE_INTO_CGROUP 0x200000000ULL /* Clone into a specific cgroup given the right permissions. */

Are those flags expected to be compatible with the legacy clone
interface on 64-bit architectures?

>> > (Note, that CLONE_LEGACY_FLAGS is already defined as
>> > #define CLONE_LEGACY_FLAGS 0xffffffffULL
>> > and used in clone3().)
>> >
>> > So the better option might be to do what you suggested, Florian:
>> > if (clone_flags & ~CLONE_LEGACY_FLAGS)
>> > 	clone_flags = CLONE_LEGACY_FLAGS?
>> > and move on?
>> 
>> Not sure what you are suggesting here.  Do you mean an unconditional
>> masking of excess bits?
>> 
>>   clone_flags &= CLONE_LEGACY_FLAGS;
>> 
>> I think I would prefer this:
>> 
>>   /* Userspace may have passed a sign-extended int value. */
>>   if (clone_flags != (int) clone_flags) /* 
>>  	return -EINVAL;
>>   clone_flags = (unsigned) clone_flags;
>
> My worry is that this will cause regressions because clone() has never
> failed on invalid flag values. I was looking for a way to not have this
> problem. But given what you say below this change might be ok/worth
> risking?

I was under the impression that current kernels perform such a check,
causing the problem with sign extension.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
