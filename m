Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8211149C6
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 00:19:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7872E3C2364
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 00:19:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1695C3C2342
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 00:19:18 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2135F14016B1
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 00:19:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575587956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEZPV6opbKCPs18mMkAV2CUFhFXStug2u3Poxhl8OpQ=;
 b=S583axrDh3saZVabnXP0B4Upy0jvGNjH7ToCU2IEvzY83px4kF8MrVZxEpVuNalgVSR+35
 N04VZ3CJT0/iYktPyO+JcD8g99w93l3aBu8nFfnq/ApTTUs1MnlM9sVlIJAev79Titso/d
 rcvCCcYrhXUi9o4JFaX6XyvajiH7eqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-qHR6md9mPnyWWXQdSjH5bg-1; Thu, 05 Dec 2019 18:19:12 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C818017DF;
 Thu,  5 Dec 2019 23:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E4326013B;
 Thu,  5 Dec 2019 23:19:11 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8AD918089C8;
 Thu,  5 Dec 2019 23:19:10 +0000 (UTC)
Date: Thu, 5 Dec 2019 18:19:10 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1013755663.15334773.1575587950733.JavaMail.zimbra@redhat.com>
In-Reply-To: <1965156629.13355311.1574352460203.JavaMail.zimbra@redhat.com>
References: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
 <ec1792be62432bb64e4d5c5085f6ebfa7e5d4b53.1573562645.git.jstancek@redhat.com>
 <20191120161634.GA31645@rei>
 <1318319247.13280749.1574323496266.JavaMail.zimbra@redhat.com>
 <20191121110236.GB14186@rei.lan>
 <1965156629.13355311.1574352460203.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.17]
Thread-Topic: futex_cmp_requeue01: fix test expectations
Thread-Index: 3aOXe1rR6P86qTP3xAokvAp9DbZnIrlQcp8i
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: qHR6md9mPnyWWXQdSjH5bg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] futex_cmp_requeue01: fix test expectations
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Any thoughts about my last reply?

----- Original Message -----
> 
> 
> ----- Original Message -----
> > Hi!
> > > > Unless spurious wakeup has happened between the requeue and wake
> > > > operation which means that the num_requeues can be smaller because we
> > > > will wake up less than requeued processes. So if we sampled spurious
> > > > wakeups before the requeue operation and after the futex_wake() for
> > > > requeued processes and call it delta_spurious we would get a range:
> > > > 
> > > > TST_RET - num_requeues >= set_wakes
> > > 
> > > This doesn't look correct if we consider spurious wakeups:
> > > 
> > > 5 processes, set_wakes = 5, set_requeue = 0, 1 spuriously wakes up,
> > > remaining 4 are woken up by futex(), 0 are requeued:
> > > 
> > > 4 - 0 >= 5
> > 
> > Well I was betting on the fact that we wake up much less processes than
> > we attempt to lock on the futex and that waking up processes takes
> > precedence. I we can add delta_spurious to the right side that wouldn't
> > change much and we end up being correct all the time, i.e.
> > 
> > TST_RET + delta_spurious - num_requeues >= set_wakes
> 
> I'd go with just spurious instead of delta_spurious. If there is spurious
> wake up before requeue (and first sample), wouldn't that fail in same way
> as example above?
> 
> TST_RET + delta_spurious - num_requeues >= set_wakes
> 4 + 0 - 0 >= 5
> 
> Also delta_spurious looks racy, because it's based on counter
> that is increased only after user-space gets chance to run. But process
> may have been already removed from futex queue on kernel side.
> So 'first sample before requeue' can see inaccurate state.
> 
> So I'd tweak your check to:
>   set_wakes-spurious <= TST_RET-num_requeues <= set_wakes+spurious
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
