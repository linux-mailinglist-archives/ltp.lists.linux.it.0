Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2B220B91
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 13:14:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8BB03C2A24
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 13:13:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D9C873C1C67
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 13:13:57 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5E8ED201296
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 13:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594811635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKUaWO9e7fa4sRKkOIzNzC3+3Xnh+pofO/mHky7hWl4=;
 b=jGcYQrgl4VMPwn9Lu7xfvmQYiPCRVfK0mXir1TQnWIOhdhi5zaqtERRXSRY6Ba1hgDRhGm
 uzntVUzbIY/vgruA30eCoHX5ldaioBcW9fb4x7E5uBVup/q6ZqdwgYzjOrbSkIsxG21rL/
 /xYaRfuMowb0/WzwT/EZbL35t6vNwd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-cLuQYJ87NsidBANh1AHWNw-1; Wed, 15 Jul 2020 07:13:51 -0400
X-MC-Unique: cLuQYJ87NsidBANh1AHWNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63081005260;
 Wed, 15 Jul 2020 11:13:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE42772E73;
 Wed, 15 Jul 2020 11:13:50 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D59C71809543;
 Wed, 15 Jul 2020 11:13:50 +0000 (UTC)
Date: Wed, 15 Jul 2020 07:13:50 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, chrubis@suse.cz
Message-ID: <467071970.2954506.1594811630753.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200715093312.5dbxlmkmolrha5vd@vireshk-i7>
References: <bd80f928abee6dac85d051c022afe559f5da8d0a.1594758146.git.jstancek@redhat.com>
 <20200715093312.5dbxlmkmolrha5vd@vireshk-i7>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.8]
Thread-Topic: tst_timer: pass kernel_timer_t type to syscalls
Thread-Index: pIfcFXsyJzUXSEIIPzJGgS0QeKU5VQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_timer: pass kernel_timer_t type to syscalls
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
> On 14-07-20, 22:24, Jan Stancek wrote:
> > timer_[gs]etttime tests are failing on s390, which is big endian
> > system, because tests are passing timer_t type, which is glibc
> > type (void *). Kernel expects and sets only int portion, so the
> > tests fail for all but first (0) timer id.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
