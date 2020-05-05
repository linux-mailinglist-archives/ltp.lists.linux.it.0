Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6F1C53EC
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 13:08:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54B663C5815
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 13:08:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 61E083C5804
 for <ltp@lists.linux.it>; Tue,  5 May 2020 13:08:08 +0200 (CEST)
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B35F81000D4E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 13:08:07 +0200 (CEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jVvQg-0001gZ-L2; Tue, 05 May 2020 11:08:02 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jVvQg-0006cW-Gc; Tue, 05 May 2020 13:08:02 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Christian Brauner <christian.brauner@ubuntu.com>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505083205.qwwdiotmmjl23aje@wittgenstein>
 <87a72m4uqm.fsf@mid.deneb.enyo.de>
 <20200505091554.eq7kzvb4twe2wgvl@wittgenstein>
 <871rny4taz.fsf@mid.deneb.enyo.de>
 <20200505095813.z7kakdbiwq7ewnmx@wittgenstein>
Date: Tue, 05 May 2020 13:08:02 +0200
In-Reply-To: <20200505095813.z7kakdbiwq7ewnmx@wittgenstein> (Christian
 Brauner's message of "Tue, 5 May 2020 11:58:13 +0200")
Message-ID: <87pnbi3ai5.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

> On Tue, May 05, 2020 at 11:36:36AM +0200, Florian Weimer wrote:
>> * Christian Brauner:
>> >> Have any flags been added recently?
>> >
>> > /* Flags for the clone3() syscall. */
>> > #define CLONE_CLEAR_SIGHAND 0x100000000ULL /* Clear any signal handler and reset to SIG_DFL. */
>> > #define CLONE_INTO_CGROUP 0x200000000ULL /* Clone into a specific cgroup given the right permissions. */
>> 
>> Are those flags expected to be compatible with the legacy clone
>> interface on 64-bit architectures?
>
> No, they are clone3() only. clone() is deprecated wrt to new features.

But without masking the clone_flags argument, won't it be passed down
to the implementation which is also used to back clone3?

> If I understood the original mail correctly, then the issue is caused by
> an interaction with sign extension and a the new flag value
> CLONE_INTO_CGROUP being defined.

Could be, but for that to happen, the flag would have to be passed
down, no?

> So from what I gather from Jan's initial mail is that when clone() is
> called on ppc64le with the CLONE_IO|SIGCHLD flag:
> clone(do_child, stack+1024*1024, CLONE_IO|SIGCHLD, NULL, NULL, NULL, NULL);
> that the sign extension causes bits to be set that raise the
> CLONE_INTO_CGROUP flag. And since the do_fork() codepath is the same for
> legacy clone() and clone3() the kernel will think that someone requested
> CLONE_INTO_CGROUP but hasn't passed a valid fd to a cgroup. If that is
> the only issue here then couldn't we just do:
>
> clone_flags &= ~CLONE3_ONLY_FLAGS?
>
> and move on, i.e. all future clone3() flags we'll just remove since we
> can assume that they have been accidently set. Even if they have been
> intentionally set we can just ignore them since that's in line with
> legacy clone()'s (questionable) tradition of ignoring unknown flags.
> Thoughts? Or am I missing some subtlety here?

What's the difference between

  clone_flags &= ~CLONE3_ONLY_FLAGS;

and

  clone_flags &= (unsigned) -1;

in this context?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
