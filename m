Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2011243F1
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 11:07:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0404B3C22C8
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 11:07:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B50953C133E
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 11:07:41 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6197B1000D45
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 11:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576663658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcSgXROuK+UWuwcJnQo6Vla8Lg0EWshHiol+ZlD/GFA=;
 b=R6wH1Dh4R8LZ+kwbKDtD+HgSZ4mvbr42bLjVcLk64shoZQf1p3paPnrVntEYIi38dz43JD
 eVvRXW4HsYtzAkbO8Ob7HMoaVok41iEdyjBINvi0KFxdrmaE9FnlcmgVkjMVA3aoM8IQ4x
 wh33PByJo/r5niBI1STa2ATt1h2beP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-8ox3ZVIdN3yWmd9aByJhIw-1; Wed, 18 Dec 2019 05:07:37 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC0210B9679;
 Wed, 18 Dec 2019 10:07:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5685E5D9E2;
 Wed, 18 Dec 2019 10:07:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CCF31809563;
 Wed, 18 Dec 2019 10:07:36 +0000 (UTC)
Date: Wed, 18 Dec 2019 05:07:35 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <461386048.17251961.1576663655809.JavaMail.zimbra@redhat.com>
In-Reply-To: <4f49ce5f-188e-2e68-d99c-5fb89acc30db@suse.cz>
References: <20191213134002.GE20795@rei.lan>
 <20191217131703.16935-1-mdoucha@suse.cz>
 <1253407522.17207718.1576616558113.JavaMail.zimbra@redhat.com>
 <8e10a190-128f-cb5b-eeaa-716598411e45@suse.cz>
 <4f49ce5f-188e-2e68-d99c-5fb89acc30db@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.11]
Thread-Topic: Use real FS block size in fallocate05
Thread-Index: LARpXnGkH9WF7dYTySwajEvfSLVtqQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 8ox3ZVIdN3yWmd9aByJhIw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Use real FS block size in fallocate05
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> On 12/18/19 10:09 AM, Martin Doucha wrote:
> > On 12/17/19 10:02 PM, Jan Stancek wrote:
> >> Is there an upstream thread link for that btrfs bug?
> > 
> > Not yet. I've reported the bug to SUSE Bugzilla for now so that our
> > kernel devs can take a closer look. But they may still decide that this
> > is expected behavior.
> 
> Update: Our kernel devs just said that this is expected behavior. Btrfs
> will only release disk space when you deallocate a whole file extent
> that can be up to 128MB in size. I'll have to add an exception for Btrfs
> to fallocate05 then. Or would you guys prefer to always deallocate the
> whole file before the last write() check?

Since it's expected to work on other file systems, I'd add exception
only for btrfs.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
