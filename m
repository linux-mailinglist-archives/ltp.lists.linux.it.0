Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA9EFDFD
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:11:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6EAC3C22C7
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:11:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E80BF3C22B8
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:11:29 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E86E110011B8
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572959486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UomK1TJd3t0l81h12WYhesuz83igag8v9CNfQQmfJo=;
 b=RToAkve8bQ73kPMp00d8U5uRN5YpZvHMYLHTOe4YGCShYojvE6ihiy9pZW5tL7eTRrO/gC
 264WSyRXuXdwhjDSPsjrA9/ARm+jbLm95gLfUWMNpfz+UEDJmfonZhaBNKDQpNh9iipvZS
 By03Met8gAx1+xvBSUvk220D7bXfQ3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-fFyzDX5WNBGdRn_awy_-Jg-1; Tue, 05 Nov 2019 08:11:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD0051800D4A;
 Tue,  5 Nov 2019 13:11:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3AE41001902;
 Tue,  5 Nov 2019 13:11:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9538518089CD;
 Tue,  5 Nov 2019 13:11:21 +0000 (UTC)
Date: Tue, 5 Nov 2019 08:11:21 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <1570001833.10536641.1572959481303.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191105005341.19033-3-petr.vorel@gmail.com>
References: <20191105005341.19033-1-petr.vorel@gmail.com>
 <20191105005341.19033-3-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.2]
Thread-Topic: fanotify: Rename fanotify_event_info_fid struct
Thread-Index: ytu45rM3yL6H0gVK+1BL4IBcyjj1yQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: fFyzDX5WNBGdRn_awy_-Jg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fanotify: Rename fanotify_event_info_fid
 struct
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
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -133,17 +133,15 @@ struct fanotify_event_info_header {
>  	uint8_t pad;
>  	uint16_t len;
>  };
> +#endif /* ! FAN_REPORT_FID */
>  
>  #ifdef HAVE_NAME_TO_HANDLE_AT
> -struct fanotify_event_info_fid {
> +struct lapi_fanotify_event_info_fid {
>  	struct fanotify_event_info_header hdr;
>  	__kernel_fsid_t fsid;
>  	unsigned char handle[0];
>  };

I think I see what you mean by "mixing glibc/lapi/kernel types".
This structure could be combination of various types and now it's
used even if sys/fanotify.h provides one.

As alternative idea, we could add some accessor macro for that 'val' field.
On musl macro would return '__val', and elsewhere 'val'.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
