Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6781A333D
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 13:32:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 047C03C2CCC
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 13:32:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DA32A3C2CBC
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 13:32:16 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2AC271401A51
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 13:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586431934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5uWdS7Bh0KrW7B73w1RRL+8t0kq053yrC34CxQQa88=;
 b=NpWlCLPydW8VjdFs+dETqRo2NoDsjxv0F23osD82fvCPK8sLwCa+50OZ9u3MuySFt9WhJG
 e8S8KL4ctinkkpixfMk9l9H+XGyH+Rqasf1bzHOCzzugwStIPDmtSQ9u05FsNPBGZ08K35
 IA0a3G9eHbYo+6ZZ0GXsFeB54ys4apQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-orfuviqxOSOue8cIR_ftjw-1; Thu, 09 Apr 2020 07:32:08 -0400
X-MC-Unique: orfuviqxOSOue8cIR_ftjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD406107B827;
 Thu,  9 Apr 2020 11:32:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0848CDBF5;
 Thu,  9 Apr 2020 11:32:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7636B18089C8;
 Thu,  9 Apr 2020 11:32:06 +0000 (UTC)
Date: Thu, 9 Apr 2020 07:32:06 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: rpalethorpe@suse.de
Message-ID: <2007623874.7795838.1586431926226.JavaMail.zimbra@redhat.com>
In-Reply-To: <87v9mahzgf.fsf@our.domain.is.not.set>
References: <20200408090635.4686-1-rpalethorpe@suse.com>
 <d950a46d-b65a-ac33-e71b-f93a2dce7620@cn.fujitsu.com>
 <1200091233.7615565.1586341144193.JavaMail.zimbra@redhat.com>
 <87v9maz1fj.fsf@our.domain.is.not.set>
 <1212083323.7622450.1586344729154.JavaMail.zimbra@redhat.com>
 <87k12qyzmq.fsf@our.domain.is.not.set> <87v9mahzgf.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.10]
Thread-Topic: add_key05: Avoid race with key garbage collection
Thread-Index: yYKKqTQkgsgeCCjK/ovYIEfgl+w2iA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
> Richard Palethorpe <rpalethorpe@suse.de> writes:
> 
> >>> I'm assuming the keys are 'deleted' when the thread keyring is destroyed
> >>> when the child process exits. However they are not freed until later by
> >>> garbage collection (maybe I am confusing deferred freeing with 'garbage
> >>> collection'?).
> >>
> >> Do you know how large is the race window?
> >>
> >> Default /proc/sys/kernel/keys/gc_delay is 300, so if it's tied to this
> >> garbage collect, I'd expect it to fail almost all the time.
> >
> > It doesn't appear to be tied to that.
> >
> >>
> >>> 
> >>> We could explicitly delete/revoke the individual keys, but AFAICT there
> >>> would still be a race because freeing is still asynchronous. Ofcourse
> >>> there might be a reliable way to force freeing?
> >>
> >> gc_delay is only one I recall.
> >>
> >> If it's tied to process being around, I can try similar approach from
> >> e747d0456adc ("syscalls/tgkill03: wait for defunct tid to get detached")
> >> where we wait for /proc/<pid>/task/<tid> to disappear.
> >
> >
> > This might work as the work is scheduled to be done in process context,
> > so the task may remain until the keys have been freed.
> 
> This doesn't seem to work.

We should probably go with your approach for now: create 2 users ahead,
so at least default case works.

I have difficulty reproducing failure on demand.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
