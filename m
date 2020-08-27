Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4888D254A11
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 17:58:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1466C3C2E9F
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 17:58:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 52AA13C1410
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 17:58:28 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D43E41A00E28
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 17:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598543903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4B1kOfvSPSGKX5Vs5GEDVv8euqYtemd260eshmmw6us=;
 b=enkg/wwVVWm+22Lv0bcZAAAMEcq9pmLmSTkemFxZwBQ0YYMjMl1vgXDqNMzoaUANo3zCp2
 NP2Xq5NoiCSEFwbejG71yZlxK7faFh+O314rVKJMDt2VGNlmg6jRjSJStCt65Uk3L3V8B5
 UYReOoMLV+Ea7YD4DcUo2IJ8eokGUDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-CHfj1d82OhmOFx7vS7gJcg-1; Thu, 27 Aug 2020 11:58:14 -0400
X-MC-Unique: CHfj1d82OhmOFx7vS7gJcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41D14101B5C2;
 Thu, 27 Aug 2020 15:58:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AC2E5D9E8;
 Thu, 27 Aug 2020 15:58:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33B62668E0;
 Thu, 27 Aug 2020 15:58:13 +0000 (UTC)
Date: Thu, 27 Aug 2020 11:58:13 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <452994585.10362765.1598543893067.JavaMail.zimbra@redhat.com>
In-Reply-To: <1175d50f-9b07-ec6e-4840-f5b61d677753@suse.cz>
References: <20200826103913.27678-1-mdoucha@suse.cz>
 <10ca0dc0c59d782bcccd5aedc99dadb5c76fed91.1598530309.git.jstancek@redhat.com>
 <1175d50f-9b07-ec6e-4840-f5b61d677753@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.6]
Thread-Topic: syscalls/setsockopt05: associate receiver with destination
 address
Thread-Index: lp7++Bri2W/OBQz0e129KzcAxtVkQw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/setsockopt05: associate receiver with
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
> I assume that cycling through different source ports prevented the issue?

Yes, it did, it ran fine over night.

> 
> Reviewed-by: Martin Doucha <mdoucha@suse.cz>
> 
> On 27. 08. 20 14:14, Jan Stancek wrote:
> > to avoid sporadic ECONNREFUSED errors (caused by delayed ICMP):
> >   safe_net.c:202: BROK: setsockopt05.c:70: send(6, 0x3ffcaf7d828, 4000,
> >   32768) failed: ECONNREFUSED (111)
> > 
> > per man(7) udp:
> >   ECONNREFUSED
> >     No receiver was associated with the destination address.
> >     This might be caused by a previous packet sent over the socket.
> > 
> > per https://tools.ietf.org/html/rfc1122#page-78
> >   The application is also responsible to avoid confusion from a delayed
> >   ICMP
> >   error message resulting from an earlier use of the same port(s).
> > 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  .../kernel/syscalls/setsockopt/setsockopt05.c | 23 ++++++++++++++-----
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > index e78ef236e337..0b7ff39d2663 100644
> > --- a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > +++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
> > @@ -31,13 +31,14 @@
> >  #define BUFSIZE 4000
> >  
> >  static struct sockaddr_in addr;
> > +static int dst_sock = -1;
> >  
> >  static void setup(void)
> >  {
> >  	int real_uid = getuid();
> >  	int real_gid = getgid();
> > -	int sock;
> >  	struct ifreq ifr;
> > +	socklen_t addrlen = sizeof(addr);
> >  
> >  	SAFE_UNSHARE(CLONE_NEWUSER);
> >  	SAFE_UNSHARE(CLONE_NEWNET);
> > @@ -45,14 +46,23 @@ static void setup(void)
> >  	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1", real_uid);
> >  	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1", real_gid);
> >  
> > -	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 12345);
> > -	sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
> > +	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 0);
> > +	dst_sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
> > +
> >  	strcpy(ifr.ifr_name, "lo");
> >  	ifr.ifr_mtu = 1500;
> > -	SAFE_IOCTL(sock, SIOCSIFMTU, &ifr);
> > +	SAFE_IOCTL(dst_sock, SIOCSIFMTU, &ifr);
> >  	ifr.ifr_flags = IFF_UP;
> > -	SAFE_IOCTL(sock, SIOCSIFFLAGS, &ifr);
> > -	SAFE_CLOSE(sock);
> > +	SAFE_IOCTL(dst_sock, SIOCSIFFLAGS, &ifr);
> > +
> > +	SAFE_BIND(dst_sock, (struct sockaddr *)&addr, addrlen);
> > +	SAFE_GETSOCKNAME(dst_sock, (struct sockaddr*)&addr, &addrlen);
> > +}
> > +
> > +static void cleanup(void)
> > +{
> > +	if (dst_sock != -1)
> > +		SAFE_CLOSE(dst_sock);
> >  }
> >  
> >  static void run(void)
> > @@ -82,6 +92,7 @@ static void run(void)
> >  static struct tst_test test = {
> >  	.test_all = run,
> >  	.setup = setup,
> > +	.cleanup = cleanup,
> >  	.taint_check = TST_TAINT_W | TST_TAINT_D,
> >  	.needs_kconfigs = (const char *[]) {
> >  		"CONFIG_USER_NS=y",
> > 
> 
> 
> --
> Martin Doucha   mdoucha@suse.cz
> QA Engineer for Software Maintenance
> SUSE LINUX, s.r.o.
> CORSO IIa
> Krizikova 148/34
> 186 00 Prague 8
> Czech Republic
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
