Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3472FA9E5
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 06:58:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E1C43C2368
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 06:58:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BEE9A3C2214
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 06:58:15 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 06FA6200B70
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 06:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573624691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrj9kzVLfkUU/xbfLQiXPUenKZsTP2CylEY53QgKfaM=;
 b=DSLoxUV0JRrMA31JCqDyPHDShp9wV87SMnu+8ILySH2sDwMolTiO2MXqjxJbpc6EEsjeq2
 Lli2MytEV+bkILoCRFR01mzdjn3qOOuU2UWT/fnLBMOKB3qmB3PxSRao4KMAkZ6mlaEiEc
 rzM8F58QJ1W5YpQb8DpjlMTd5GvGc08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-1-VwGcf5NXKY5ZN55JIKVw-1; Wed, 13 Nov 2019 00:58:08 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 552DD100550E;
 Wed, 13 Nov 2019 05:58:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45000101E3CB;
 Wed, 13 Nov 2019 05:58:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 955EF18095FF;
 Wed, 13 Nov 2019 05:58:05 +0000 (UTC)
Date: Wed, 13 Nov 2019 00:58:05 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <902626520.11813984.1573624685378.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191113005626.19585-1-petr.vorel@gmail.com>
References: <20191113005626.19585-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.22]
Thread-Topic: fanotify musl fixes
Thread-Index: WL7f9PpcqkBF7/OKVsElNIBnsMtY0Q==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 1-VwGcf5NXKY5ZN55JIKVw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] fanotify musl fixes
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi,
> 
> I generalized previous patch set a bit via autotools checks and also add
> other cleanup (base decisions whether to define fallback definitions on
> autotools checks).
> 
> BTW I tempted to use <linux/fanotify.h>, but not only we'd have to
> define fanotify_mark(), but we'd also lost libc header testing.
> 
> https://travis-ci.org/pevik/ltp/builds/611138280
> (openSUSE Tumbleweed failure is not related to this change)

Hi Petr,

looks good to me. 2/3 rework makes it easier to follow too.
I tried it on couple old/new RHEL distros with no issues.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
