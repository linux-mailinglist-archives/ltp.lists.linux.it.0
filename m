Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9461F66B7
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 13:34:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FDA73C613B
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 13:34:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DE3B43C0198
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 13:34:02 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 0607D1000B26
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 13:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZvrp/rL5vtKe/ZwmUdZj84t5nLLWZiiMMC5O6hFS6A=;
 b=G/OKp+q2X6gDQSgL/+oZ6A84UwYuohjZj+vdc+uEEzuczUAKYvgy5D+6HgAYdicRkmHy/s
 dUZMYysfWok3vFfy79CTgSDMXwxlpWpsn0tcYJ8D7AyVHOMhCESEj7pwy5oJs1D50ZR0Hx
 xpd1j45ip1C7d636t9Zpt/czK+sKczg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-6twmsa5tOoyj1clWimpcgg-1; Thu, 11 Jun 2020 07:33:58 -0400
X-MC-Unique: 6twmsa5tOoyj1clWimpcgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E877D7BAD;
 Thu, 11 Jun 2020 11:33:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E06602B580;
 Thu, 11 Jun 2020 11:33:56 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD50B104809;
 Thu, 11 Jun 2020 11:33:56 +0000 (UTC)
Date: Thu, 11 Jun 2020 07:33:56 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <1118360748.15618585.1591875236530.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200609071611.9467-1-vikas.kumar2@arm.com>
References: <20200609071611.9467-1-vikas.kumar2@arm.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.7]
Thread-Topic: syscalls/fork14: Fix Buffer overflow
Thread-Index: blD9Kji5aLTpwGx0GfPUq9KJ285vuA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fork14: Fix Buffer overflow
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
Cc: amit kachhap <amit.kachhap@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> This change basically avoids the buffer overflow by keeping the check count
> to allocation limit
> The problem occurs when there is no failure and i == EXTENT, so
> pointer_vec[EXTENT] goes beyond the allocated buffer.

I changed the patch to use a new variable, that reflects number of used
fields, and pushed.

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
