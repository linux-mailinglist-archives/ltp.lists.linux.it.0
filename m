Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A63522501C9
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 18:11:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E5803C2EF4
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 18:11:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 447FC3C1D45
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 18:11:53 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C14F0600722
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 18:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598285511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tm2162XFT1OGTb7GMVXBiXBHBS5851ofizycWCyvxQY=;
 b=eN3dzyAwo7sVq4zOBZ++NuYtJs00Mgo0U0Pwl5E3hKkWNztYEdCrSmnxmF8oyf58YM/B28
 Hu/Sl6wImTSrD/REoYRKVibPxO7F+aiMDAg1Xaxe7bYmSDTsZD21tU8QqlKeN7xQvBFHCy
 XrbD4sElVoLn7AteGqy2GwqBESyeDrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-cPVS_OJfNP2Bts2fKZjknA-1; Mon, 24 Aug 2020 12:11:44 -0400
X-MC-Unique: cPVS_OJfNP2Bts2fKZjknA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F7971084C87;
 Mon, 24 Aug 2020 16:11:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58D6B1002D55;
 Mon, 24 Aug 2020 16:11:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 203E418A0B64;
 Mon, 24 Aug 2020 16:11:43 +0000 (UTC)
Date: Mon, 24 Aug 2020 12:11:42 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <285733961.9872750.1598285502957.JavaMail.zimbra@redhat.com>
In-Reply-To: <9821e566-3263-36fd-651e-4f5019e486e1@suse.cz>
References: <c73f6b2e1232d6a892ecef76370ea2cf6c7dd044.1598270814.git.jstancek@redhat.com>
 <de536b1b-0751-f50c-3869-b1b7956bda84@suse.cz>
 <1425720351.9865762.1598281277578.JavaMail.zimbra@redhat.com>
 <9821e566-3263-36fd-651e-4f5019e486e1@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.19]
Thread-Topic: syscalls/setsockopt05: associate receiver with destination
 address
Thread-Index: d0pvcX9iYsSwAff+1FC4Vh0473egvw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setsockopt05: associate receiver with
 destination address
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
> On 24. 08. 20 17:01, Jan Stancek wrote:
> > I assumed it's from previous one, not partial one. From man(7) udp:
> > 
> >  ECONNREFUSED
> >               No receiver was associated with the destination address.
> >               This might be caused by a previous packet sent over the
> >               socket.
> > 
> 
> Wait, looking closer at the error message, it looks like send(MSG_MORE)
> is broken on your test kernel. Let me quote the man page here:

Aren't we getting propagated ICMP error to send() from previous iteration
of the loop?

Per https://tools.ietf.org/html/rfc1122#page-78
  The application is also responsible to avoid confusion from a delayed ICMP
  error message resulting from an earlier use of the same port(s).


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
