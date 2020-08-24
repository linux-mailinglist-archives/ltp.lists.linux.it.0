Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632025004F
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 17:01:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEB693C2EF4
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 17:01:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0A1A33C12A1
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 17:01:22 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 59A331000A6C
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 17:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598281280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqP22uwwe4Vgsi9cCtki/HUOTV22Xat7oGtrfT+e6kI=;
 b=GX90rGsmO8RI7kpMwRL0AYOU6Bd3q/llUD9O0JSJnNGwWqtvbJLkYbvgj/z8SqzhVqCxJz
 dbxs0J3XzeUAbjHY4bVLrzwmS8XqD9GodsrTsyGUXXdft0h5syBDcxbnaH5QB32bnSSats
 BHpHHEKfLryP9/m+4PHREIsuuYp91KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-11_rCIF9MnuPuG8nzUPiRA-1; Mon, 24 Aug 2020 11:01:18 -0400
X-MC-Unique: 11_rCIF9MnuPuG8nzUPiRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E73801AF8;
 Mon, 24 Aug 2020 15:01:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1AC46FDB7;
 Mon, 24 Aug 2020 15:01:17 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id EABCF66915;
 Mon, 24 Aug 2020 15:01:17 +0000 (UTC)
Date: Mon, 24 Aug 2020 11:01:17 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1425720351.9865762.1598281277578.JavaMail.zimbra@redhat.com>
In-Reply-To: <de536b1b-0751-f50c-3869-b1b7956bda84@suse.cz>
References: <c73f6b2e1232d6a892ecef76370ea2cf6c7dd044.1598270814.git.jstancek@redhat.com>
 <de536b1b-0751-f50c-3869-b1b7956bda84@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.6]
Thread-Topic: syscalls/setsockopt05: associate receiver with destination
 address
Thread-Index: R88WE9NfWyk/s7HC0KIliePS/RoASg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
> Hi,
> 
> On 24. 08. 20 14:10, Jan Stancek wrote:
> > to avoid sporadic ECONNREFUSED errors:
> >   safe_net.c:202: BROK: setsockopt05.c:70: send(6, 0x3ffcaf7d828, 4000,
> >   32768) failed: ECONNREFUSED (111)
> > 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  testcases/kernel/syscalls/setsockopt/setsockopt05.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > index e78ef236e337..469e5a64bf71 100644
> > --- a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > +++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > @@ -37,6 +37,7 @@ static void setup(void)
> >  	int real_uid = getuid();
> >  	int real_gid = getgid();
> >  	int sock;
> > +	int port = TST_GET_UNUSED_PORT(AF_INET, SOCK_DGRAM);
> >  	struct ifreq ifr;
> >  
> >  	SAFE_UNSHARE(CLONE_NEWUSER);
> > @@ -45,14 +46,14 @@ static void setup(void)
> >  	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1", real_uid);
> >  	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1", real_gid);
> >  
> > -	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 12345);
> > +	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, port);
> 
> Please don't use TST_GET_UNUSED_PORT() this way. The correct way to do
> this is to set port to 0 and then read the address back using
> SAFE_GETSOCKNAME() after bind(). It's the same amount of code but
> without any race conditions.

Fair point.

> 
> >  	sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
> >  	strcpy(ifr.ifr_name, "lo");
> >  	ifr.ifr_mtu = 1500;
> >  	SAFE_IOCTL(sock, SIOCSIFMTU, &ifr);
> >  	ifr.ifr_flags = IFF_UP;
> >  	SAFE_IOCTL(sock, SIOCSIFFLAGS, &ifr);
> > -	SAFE_CLOSE(sock);
> 
> Don't forget to close the socket in cleanup().
> 
> > +	SAFE_BIND(sock, (struct sockaddr *)&addr, sizeof(struct sockaddr));
> >  }
> >  
> >  static void run(void)
> > 
> 
> Though I wonder whether setsockopt(SO_NO_CHECK, 1) is really supposed to
> flush the partial packet. Are you sure it's not a bug in the kernel?

I assumed it's from previous one, not partial one. From man(7) udp:

 ECONNREFUSED
              No receiver was associated with the destination address.
              This might be caused by a previous packet sent over the socket.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
