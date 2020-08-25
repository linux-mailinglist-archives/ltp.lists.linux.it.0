Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFC2519D9
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 15:38:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 459F03C27EC
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 15:38:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CDBF33C12A1
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 15:38:28 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BB8746008DB
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 15:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598362706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJAennYMBhfVRQUyyklDRk2NxcU8FdfVOKOtpl34C64=;
 b=IJtFj6gCV0Rq+PdzRqvtbDtXdZO4BswtadVmM9Vv5C7IPswK0pRI9CVLtim+VUSylwhXK9
 yVznVpjuVsr2ZqUf2LS+E7+SiFugpsaq9KY/8xxI7/ZAWloBG+w/8xw6hj5tesEDWHU2hW
 u0qkwOLJGMhaEdpc4hlSi3RVJ6OZM40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-HGlfw3CuPC2-RG8GlfqHrA-1; Tue, 25 Aug 2020 09:38:22 -0400
X-MC-Unique: HGlfw3CuPC2-RG8GlfqHrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98782640C2;
 Tue, 25 Aug 2020 13:38:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6570F10013C2;
 Tue, 25 Aug 2020 13:38:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 865181826D29;
 Tue, 25 Aug 2020 13:38:20 +0000 (UTC)
Date: Tue, 25 Aug 2020 09:38:20 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1390277350.9966000.1598362700248.JavaMail.zimbra@redhat.com>
In-Reply-To: <d2a4fdfb-4686-eedc-a22b-464f9ed5982d@suse.cz>
References: <c73f6b2e1232d6a892ecef76370ea2cf6c7dd044.1598270814.git.jstancek@redhat.com>
 <de536b1b-0751-f50c-3869-b1b7956bda84@suse.cz>
 <1425720351.9865762.1598281277578.JavaMail.zimbra@redhat.com>
 <9821e566-3263-36fd-651e-4f5019e486e1@suse.cz>
 <285733961.9872750.1598285502957.JavaMail.zimbra@redhat.com>
 <d2a4fdfb-4686-eedc-a22b-464f9ed5982d@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.8]
Thread-Topic: syscalls/setsockopt05: associate receiver with destination
 address
Thread-Index: r2551zJT4xOuvotC6jt954iN/Bg7pA==
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
> On 24. 08. 20 18:11, Jan Stancek wrote:
> > Aren't we getting propagated ICMP error to send() from previous iteration
> > of the loop?
> > 
> > Per https://tools.ietf.org/html/rfc1122#page-78
> >   The application is also responsible to avoid confusion from a delayed
> >   ICMP
> >   error message resulting from an earlier use of the same port(s).
> 
> The test is using the loopback address. There should be no delay. We're
> running this test daily on 7 different kernel versions and 4 different
> archs and I've never seen it fail with ECONNREFUSED, ever.


Similar here, it runs daily dozens of times, but appears to fail sporadically
only on s390x.

> 
> But you can prove me wrong by adding a few debug prints around both
> send() calls.

1. extra prints
 65         for (i = 0; i < 1000; i++) {
 66                 sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
 67                 SAFE_CONNECT(sock, (struct sockaddr *)&addr, sizeof(addr));
 68                 printf("1 %d\n", i);
 69                 SAFE_SEND(1, sock, buf, BUFSIZE, MSG_MORE);
 70                 printf("2 %d\n", i);
 71                 SAFE_SETSOCKOPT_INT(sock, SOL_SOCKET, SO_NO_CHECK, 1);
 72                 printf("3 %d\n", i);
 73                 send(sock, buf, 1, 0);
 74                 printf("4 %d\n", i);
 75                 SAFE_CLOSE(sock);

1 246
2 246
3 246
4 246
1 247
2 247
3 247
4 247
1 248

safe_net.c:202: BROK: setsockopt05.c:69: send(3, 0x3ffc397db88, 4000, 32768) failed: ECONNREFUSED (111)

2. SO_NO_CHECK doesn't matter, following fails:
                sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
                SAFE_CONNECT(sock, (struct sockaddr *)&addr, sizeof(addr));
                SAFE_SEND(1, sock, buf, BUFSIZE, MSG_MORE);
                send(sock, buf, 1, 0);
                SAFE_CLOSE(sock);

3. MSG_MORE doesn't matter, following fails:
                sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
                SAFE_CONNECT(sock, (struct sockaddr *)&addr, sizeof(addr));
                SAFE_SEND(1, sock, buf, BUFSIZE, 0);
                SAFE_CLOSE(sock);

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
