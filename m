Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF61C34F0
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:51:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 010713C269B
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:51:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D53C03C267C
 for <ltp@lists.linux.it>; Mon,  4 May 2020 10:51:39 +0200 (CEST)
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DEC74600793
 for <ltp@lists.linux.it>; Mon,  4 May 2020 10:51:27 +0200 (CEST)
Received: by mail-io1-xd43.google.com with SMTP id 19so11410374ioz.10
 for <ltp@lists.linux.it>; Mon, 04 May 2020 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KhNEVSHcF1nyYIe7lu32/aZEQyNJbvCmafyYq2iPNi4=;
 b=KgYjcEuqcBC9XAYGtM7dQso2CNffGdyfcyAsnaNxAcXYESfUc1+rdM5AJd/9RnviiQ
 ajJgatqEBWTrM4XT2WrgioJmMLeVaOZLK5aNAaSj+wQv2Anb9AO61eXR04S7e5WU9oc4
 NF4RhmabEqQH8zKKA75pwxhvBy7yRFcwmGeUSGAJotiH3iqTeGwJMuC1b0WkxJEakiDx
 hOV62xXdb1wyZbpJeq2+zKjhso4yGPSPKS0Rdw923pjZvYLRE6f5IyNjBxtW2vWyHA2l
 FBav3CqkQwMHf+lHYkOuOhZtYjy5z6Q6CXa2cbVXBUtA0zFNiH5nfskPktXrOqIPGk8z
 KtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KhNEVSHcF1nyYIe7lu32/aZEQyNJbvCmafyYq2iPNi4=;
 b=VJWm0W7KuYzO7NgSYALncNNCp4guQbxv0jPlmVv0AvOIJu57PQP0tUqUSkV2QCQ5/m
 fgQO3Tb/mILxVZjH55mvu9wNK775SpVM41gaoiJmC0qsTp2SpJ59zTGXut+D+Cu+3kwP
 Bi5Vt+FaH5L+dUYdQp54Dped3VGoJDWu9Vb0Fq+ch8c6aZgW/l1YMK04HzsZNO/85wjR
 owT/4ulguMltBEGiMGhSfRK2i9WujvIudd6/zlq3yLPyb+K2YCNwOxDy8QxUeFDC7zDP
 rFCJ1MpgFV2TgYOMIftnXfP6zB4q1gp+HzvCWcePPj2AIXiESv21DCht9Rb3uY+EGs4L
 05/Q==
X-Gm-Message-State: AGi0PubCZBpAZXJz/sux/idVsMa9fgJ7i+509Gs3L4UR6tJqrwQn1pvO
 v8xZAePfQEZtXQWQaMNHXGGmcOs41M9onYgFjJ0=
X-Google-Smtp-Source: APiQypKeL+lVcBDgRYrfV9I6BjaREnUcfjvz7UG7Zj4SDcfkseu0ahiamcC5qKE11XqXQWsK8TE0ULBBw0t9Du3PQmM=
X-Received: by 2002:a6b:7317:: with SMTP id e23mr14470945ioh.72.1588582298025; 
 Mon, 04 May 2020 01:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-3-amir73il@gmail.com>
 <20200504080715.GA1741@quack2.suse.cz>
In-Reply-To: <20200504080715.GA1741@quack2.suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 4 May 2020 11:51:27 +0300
Message-ID: <CAOQ4uxgJQ2MGdnib9gvc=PcoWxveUpyqDZ1YybT-Hxrhba9ApQ@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] syscalls/fanotify15: Add a test case for
 inode marks
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, May 4, 2020 at 11:07 AM Jan Kara <jack@suse.cz> wrote:
>
> On Sat 02-05-20 19:27:42, Amir Goldstein wrote:
> > Test reporting events with fid also with recusrive inode marks:
> > - Test events "on self" (FAN_DELETE_SELF) on file and dir
> > - Test events "on child" (FAN_MODIFY) on file
> >
> > With recursive inode marks, verify that the FAN_MODIFY event reported
> > to parent "on child" is merged with the FAN_MODIFY event reported to
> > child.
> >
> > The new test case is a regression test for commit f367a62a7cad:
> >
> >     fanotify: merge duplicate events on parent and child
>
> The test looks OK but do we want a test for this? I mean: A test like this
> seems to imply we promise to merge identical events. Although that is a
> good general guideline, I consider it rather an optimization that may or
> may not happen but userspace should not rely on it. Thoughts?

The thing is, those are not really two identical events.
This is in fact the same event (fsnotify_change() hook was called once).
The fact that listener process may have an inode watch, parent directory
watch and a filesystem watch should not affect the number of read events.

Now it's true that internally, fsnotify_dentry() emits two event flavors to
parent and to victim. For inotify it even made some sense, because listener
would read two different event flavors with two different formats.
With fanotify (either reporting fd or fid) receiving two events makes very
little sense.

I agree that the fix (merging those events) is best effort and we cannot
commit to merging the events, but this isolated regression test does
check the best effort fix reliably and this is the reason I think it
should stay.

Upcoming FAN_REPORT_NAME is about to change the picture a bit
towards the inotify behavior - victim watch gets event without name,
parent watch gets event with name, filesystem watch gets both event
flavors... that is, if you will agree to this behavior, but we shall continue
this discussion on the fanotiify_name patches....

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
