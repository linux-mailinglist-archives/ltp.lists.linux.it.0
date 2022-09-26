Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B65EBC0A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Sep 2022 09:54:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF7AA3CADF7
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Sep 2022 09:54:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F40BF3C97BB
 for <ltp@lists.linux.it>; Tue, 27 Sep 2022 00:17:40 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 16F901400C47
 for <ltp@lists.linux.it>; Tue, 27 Sep 2022 00:17:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 65E181F6E6;
 Mon, 26 Sep 2022 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664230656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=potGjxjoH+hIyAh2xqH0ValNwAn6yqrKENIXVz/RW20=;
 b=lDMtMPgaHezeSAbJ+1nNyQzDaXgPvVuZgkDfL16jdVoypa+35w/tGkTDuSMb4XIm0QKe5M
 49p3CKFcos6UWKL3wJTx2XApZPZz6PWHbCxvNMyNr9DEFeaeBwQErQhx0BcE99o7+DbzKU
 Y8YGxX4bs4d8Ci45jjvyX7kyL6BccPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664230656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=potGjxjoH+hIyAh2xqH0ValNwAn6yqrKENIXVz/RW20=;
 b=OaV3Qsn7PPx/CgPBXquf49UPHCJx/UqN+3zTjIsFNzKDKnmXHGSFdLd7f3nF/x06RkIONM
 8EvFLoKAKJvZuAAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A232139BD;
 Mon, 26 Sep 2022 22:17:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zEuBAP8kMmNiOwAAMHmgww
 (envelope-from <mpdesouza@suse.de>); Mon, 26 Sep 2022 22:17:35 +0000
Date: Mon, 26 Sep 2022 19:17:32 -0300
From: Marcos Paulo de Souza <mpdesouza@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20220926221732.xj7mcxswq4dixzcd@daedalus>
References: <20220926165949.23407-1-mpdesouza@suse.com>
 <YzH86TOjFZj3cUwq@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YzH86TOjFZj3cUwq@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 27 Sep 2022 09:54:57 +0200
Subject: Re: [LTP] [PATCH] configure.ac: Fix redefinition of mount_attr by
 checking sys/mount.h
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

On Mon, Sep 26, 2022 at 09:26:33PM +0200, Petr Vorel wrote:
> Hi Marcos,
> 
> > mount_setattr and mount_attr are defined in sys/mount.h.
> 
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> >  Tested on openSUSE Tumbleweed
> 
> >  configure.ac | 1 +
> >  1 file changed, 1 insertion(+)
> 
> > diff --git a/configure.ac b/configure.ac
> > index 1deeffc0c..0e9895415 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -71,6 +71,7 @@ AC_CHECK_HEADERS_ONCE([ \
> >      sys/epoll.h \
> >      sys/fanotify.h \
> >      sys/inotify.h \
> > +    sys/mount.h \
> 
> Well, we don't add check for this, as sys/mount.h has been here since "ever", so
> it'd just make configure little bit slower for no gain.
> 
> But you'd have to use somewhere compiler macro #ifdef HAVE_SYS_MOUNT_H, as this
> macro is generated by configure script. Adding header to the list does nothing.

It wasn't needed in my case, let me explain better below.

> 
> You obviously wanted to fix something, could you post the problem you're trying
> to solve + steps you did to ML?

I was seeing redefinition problems:

In file included from fsconfig01.c:9:
../../../../include/lapi/fsmount.h:55:8: error: redefinition of 'struct mount_attr'
   55 | struct mount_attr {
      |        ^~~~~~~~~~
In file included from /usr/include/sys/mount.h:32,
                 from ../../../../include/lapi/fsmount.h:14:
/usr/include/linux/mount.h:129:8: note: originally defined here
  129 | struct mount_attr {
      |        ^~~~~~~~~~
../../../../include/lapi/fsmount.h:110:19: error: conflicting types for 'mount_setattr'; have 'int(int,  const char *, unsigned int,  struct mount_attr *, size_t)' {aka 'int(int,  const char *, unsigned int,  struct mount_attr *, long unsigned int)'}
  110 | static inline int mount_setattr(int dirfd, const char *from_pathname, unsigned int flags,
      |                   ^~~~~~~~~~~~~
In file included from fsconfig02.c:8:
../../../../include/lapi/fsmount.h:55:8: error: redefinition of 'struct mount_attr'
   55 | struct mount_attr {
      |        ^~~~~~~~~~
/usr/include/sys/mount.h:316:12: note: previous declaration of 'mount_setattr' with type 'int(int,  const char *, unsigned int,  struct mount_attr *, size_t)' {aka 'int(int,  const char *, unsigned int,  struct mount_attr *, long unsigned int)'}
  316 | extern int mount_setattr (int __dfd, const char *__path, unsigned int __flags,
      |            ^~~~~~~~~~~~~
In file included from /usr/include/sys/mount.h:32,
                 from ../../../../include/lapi/fsmount.h:14:
/usr/include/linux/mount.h:129:8: note: originally defined here
  129 | struct mount_attr {
      |        ^~~~~~~~~~
../../../../include/lapi/fsmount.h:110:19: error: conflicting types for 'mount_setattr'; have 'int(int,  const char *, unsigned int,  struct mount_attr *, size_t)' {aka 'int(int,  const char *, unsigned int,  struct mount_attr *, long unsigned int)'}
  110 | static inline int mount_setattr(int dirfd, const char *from_pathname, unsigned int flags,
      |                   ^~~~~~~~~~~~~
/usr/include/sys/mount.h:316:12: note: previous declaration of 'mount_setattr' with type 'int(int,  const char *, unsigned int,  struct mount_attr *, size_t)' {aka 'int(int,  const char *, unsigned int,  struct mount_attr *, long unsigned int)'}
  316 | extern int mount_setattr (int __dfd, const char *__path, unsigned int __flags,
      |            ^~~~~~~~~~~~~
make[4]: *** [../../../../include/mk/rules.mk:45: fsconfig01] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: *** [../../../../include/mk/rules.mk:45: fsconfig02] Error 1
make[3]: *** [../../../include/mk/generic_trunk_target.inc:108: all] Error 2
make[2]: *** [../../include/mk/generic_trunk_target.inc:108: all] Error 2
make[1]: *** [../include/mk/generic_trunk_target.inc:108: all] Error 2
make[1]: Leaving directory '/home/mpdesouza/git/ltp/testcases'
make: *** [Makefile:106: testcases-all] Error 2

In my TW system I found that the struct mount_attr was being defined in
sys/mount.h. Checking include/lapi/fsmount.h I found some ifdefs:

...
#ifndef HAVE_STRUCT_MOUNT_ATTR
/*
 * mount_setattr()
 */
struct mount_attr {
        uint64_t attr_set;
        uint64_t attr_clr;
        uint64_t propagation;
        uint64_t userns_fd;
};
#endif
...

#ifndef HAVE_MOUNT_SETATTR
static inline int mount_setattr(int dirfd, const char *from_pathname, unsigned int flags,
                                struct mount_attr *attr, size_t size)
{
        return tst_syscall(__NR_mount_setattr, dirfd, from_pathname, flags,
                           attr, size);
}
#endif /* HAVE_MOUNT_SETATTR */

So, only adding the sys/mount.h entry to the headers list is enough to make
autoconf to find that sys/mount.h defines the same struct and function, fixing
the issue.

> 
> BTW I have no problem to build locally on the latest Tumbleweed. Also LTP
> package build for Tumbleweed is also fine:
> https://build.opensuse.org/package/binaries/benchmark:ltp:devel/ltp/openSUSE_Factory
> https://build.opensuse.org/package/binaries/benchmark:ltp:devel/ltp/openSUSE_Tumbleweed

Interesting... so is there anything wrong with my setup? Am I missing something?

> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
