Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 123EE1A1FB8
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 13:18:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA7DF3C2D1F
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 13:18:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2B16A3C2D12
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 13:18:54 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E118C2000E1
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 13:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586344732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdI08SFTdZ2yNkK9hI9ZD/ebKo1YMhCx4flVXxpUWnk=;
 b=d5AnTYLniMCfmi0K7LhoagchMqqyczhoX7xp0QtuKXd3DYP4apNh3emPdBpkS0CM0HKPO/
 YPvXC+chhAUHykAmPaj/2gWCqkmwliRswQXYFnaqlZ/DNNN42MLa0rmmZFtA4fs6Ap6rOH
 YPAju943fabLhRqmDyzjc/2KU3ssfGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-kA8Ih2i4MmG5bHDVA6KiDQ-1; Wed, 08 Apr 2020 07:18:50 -0400
X-MC-Unique: kA8Ih2i4MmG5bHDVA6KiDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B2F9107ACCA;
 Wed,  8 Apr 2020 11:18:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 721DCC0D84;
 Wed,  8 Apr 2020 11:18:49 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EBAC93A98;
 Wed,  8 Apr 2020 11:18:49 +0000 (UTC)
Date: Wed, 8 Apr 2020 07:18:49 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: rpalethorpe@suse.de
Message-ID: <1212083323.7622450.1586344729154.JavaMail.zimbra@redhat.com>
In-Reply-To: <87v9maz1fj.fsf@our.domain.is.not.set>
References: <20200408090635.4686-1-rpalethorpe@suse.com>
 <d950a46d-b65a-ac33-e71b-f93a2dce7620@cn.fujitsu.com>
 <1200091233.7615565.1586341144193.JavaMail.zimbra@redhat.com>
 <87v9maz1fj.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.27]
Thread-Topic: add_key05: Avoid race with key garbage collection
Thread-Index: vol73glKpY5WdcBAxBSVo8WkA6HWVA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] add_key05: Avoid race with key garbage
 collection
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
Cc: Li Wang <liwan@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hello,
> 
> Jan Stancek <jstancek@redhat.com> writes:
> 
> > ----- Original Message -----
> >> Hi Richard
> >>
> >> > The key subsystem independently tracks user info against UID. If a user
> >> > is
> >> > deleted and the UID reused for a new user then the key subsystem will
> >> > mistake
> >> > the new user for the old one.
> >
> > Thanks for raising this problem Richard. This matches CKI failure
> > we seen recently. (CC Li and Rachel)
> >
> >> Does any documentation or kernel comment mentioned this? I didn't notice
> >> this before.
> >> >
> >> > The keys/keyrings may not be accessible to the new user, but if they are
> >> > not
> >> > yet garbage collected (which happens asynchronously) then the new user
> >> > may
> >> > be
> >> > exceeding its quota limits.
> >> >
> >> > This results in a race condition where this test can fail because the
> >> > old
> >> > thread keyring is taking up the full quota. We should be able to avoid
> >> > this
> >> > by
> >> > creating two users in parallel instead of sequentially so that they have
> >> > different UIDs.
> >> I guess you may want to creat two user, so next, the key subsystem
> >> think the new user is different from  the last deleting user. It can
> >> avoid race.
> >>
> >> But you patch overrides ltpuser, in actually, we still use
> >> ltp_add_key05_1 in SAFE_SETUID.
> >>
> >> Also, this patch doesn't handle delete user when we using -i parameters.
> >
> > -i might be problem, but other than that I think it works, at least for
> > default run.
> >
> > Though I'm wondering, shouldn't the test delete keys it creates,
> > rather than relying on garbage collection?
> 
> I'm assuming the keys are 'deleted' when the thread keyring is destroyed
> when the child process exits. However they are not freed until later by
> garbage collection (maybe I am confusing deferred freeing with 'garbage
> collection'?).

Do you know how large is the race window?

Default /proc/sys/kernel/keys/gc_delay is 300, so if it's tied to this
garbage collect, I'd expect it to fail almost all the time.

> 
> We could explicitly delete/revoke the individual keys, but AFAICT there
> would still be a race because freeing is still asynchronous. Ofcourse
> there might be a reliable way to force freeing?

gc_delay is only one I recall.

If it's tied to process being around, I can try similar approach from 
e747d0456adc ("syscalls/tgkill03: wait for defunct tid to get detached")
where we wait for /proc/<pid>/task/<tid> to disappear.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
