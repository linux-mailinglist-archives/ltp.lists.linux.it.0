Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D5146BF4
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:55:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C13593C24E6
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:55:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7B30E3C1FEC
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:55:41 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0DA88602114
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579791339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjR6en6S0LP8+ecfcKjMzOtQcsW9AsOLo6I/kAcs0z0=;
 b=SM/hSsWrNTQX8veVuubsbNZnXDvPDnbHqzkHawm/cW1S2jDS+72/KhXMs8ZVTrRIvRgPID
 cWE6VGsv84ERpynSHZs3V/vMhi2dB5002LeB3jx+3vmaOLNm9FhAFph12OzGmL+BPcDOiQ
 qsHJkWHV5WW07Qfd8AxJ/9GCgwjkorQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-EbRhfOS7Ocmj6yvXM9y3rw-1; Thu, 23 Jan 2020 09:55:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4971137848;
 Thu, 23 Jan 2020 14:55:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C1F80896;
 Thu, 23 Jan 2020 14:55:34 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DA7481998;
 Thu, 23 Jan 2020 14:55:34 +0000 (UTC)
Date: Thu, 23 Jan 2020 09:55:34 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <239304412.3515101.1579791334045.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200123143137.23214-1-mdoucha@suse.cz>
References: <20200123143137.23214-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.27]
Thread-Topic: Fix prctl02
Thread-Index: IvcwNH+092SIrBfCt/MVSLQg1/c1zg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: EbRhfOS7Ocmj6yvXM9y3rw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix prctl02
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
> The prctl() system call takes 5 integer arguments but only 3 of them were
> passed in the test. This means that the system call read random garbage
> from stack in place of the two missing arguments and failed even on some
> perfectly valid combinations of arguments on some platforms.
> 
> - Fixed arguments in test case 9 (second PR_SET_NO_NEW_PRIVS)
> - Dropped test case 13 (PR_CAP_AMBIENT) because the args are valid
> - Dropped test case 14 (PR_GET_SPECULATION_CTRL) because the args are valid

Can we make them invalid and keep the test cases?
For example:
 PR_CAP_AMBIENT arg2 could be num_invalid
 PR_GET_SPECULATION_CTRL arg3 could be num_1

The rest looks good to me.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
